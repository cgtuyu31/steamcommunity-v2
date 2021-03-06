<%-- 
    Document   : thread
    Created on : Feb 23, 2017, 6:21:14 PM
    Author     : Sujana
--%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="client.JerseyClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="head.jsp" flush="true" />
    </head>
    <body>
        <%
            JerseyClient jc = new JerseyClient();
            JSONObject currentThread= (JSONObject) JSONValue.parse(jc.getThread(request.getParameter("tid")));
            String threadid =currentThread.get("threadid").toString();
            JSONArray posts = (JSONArray) JSONValue.parse(jc.getAllPost(threadid));
            JSONObject poster = (JSONObject) JSONValue.parse(jc.getUser(currentThread.get("userid").toString()));
            String imgurl = poster.get("imageurl").toString();
//            User u = CtrlAccount.getUser((Integer) session.getAttribute("currentsession"));
//            boolean moderator = false;
//            if (u != null) {
//                if (u.getDiscussion() != null) {
//                    if (u.getDiscussion().getDiscussionId() == Integer.parseInt(request.getParameter("id"))) {
//                        moderator = true;
//                    }
//
//                }
//            }
        %>
        <div class="container">
            <jsp:include page="header.jsp" flush="true" />
            <div class="content">
                <jsp:include page="headerthread.jsp" flush="true" />
                <div class="contentthread">
                    <div class="contentthreadleft">
                        
                        <div class="firstpost">
                            <div class="headpost">
                                <div class="profile_post" style="
                                    background-image: url('image/user/<%=imgurl%>'); 
                                    background-repeat: no-repeat; 
                                    background-size:contain; ">
                                </div> 
                                <div class="profile_namepost">
                                    <a href="profile.jsp?uid=<%=poster.get("userid").toString()%>"><%= poster.get("username").toString()%> </a>
                                </div>
                            </div>
                            <div class="firstcontent">
                                <h2><%= currentThread.get("title").toString()%></h2>
                                <text> <%= ((JSONObject)posts.get(0)).get("message").toString().replace("\n", "<br />") %></text>
                       <%--
                                    
                                    if(u != null){
                                        if(u.getUserId() == poster.getUserId() || moderator){
                                    %>                                        
                                            <p style="text-align: right; font-size: 13px;margin-bottom: -15px">
                                            <a href="editpost.jsp?postid=<%=posts.get(0).getPostId()%>&id=<%=request.getParameter("id")%>" style="color:white;">Edit Post</a>
                                        </p>
                                        <%
                                        }
                                    }
                                --%>
                                <p style="text-align: right; font-size: 13px;">#1</p>
                            </div>
                        </div>
                    <%
                        for (int i = 1; i<posts.size() ; i++) {
                            String usrid = ((JSONObject) posts.get(i)).get("userid").toString();
                            JSONObject usercom = (JSONObject) JSONValue.parse(jc.getUser(usrid));
             
                        %>
                            <div class="contentpost">
                                <div class="headpost">
                                    <div class="profile_post" style="
                                         background-image: url('image/user/<%=usercom.get("imageurl").toString()%>'); 
                                         background-repeat: no-repeat; 
                                         background-size:contain; ">
                                    </div> 
                                    <div class="profile_namepost">
                                        <a href="profile.jsp?uid=<%=usercom.get("userid").toString()%>"><%= usercom.get("username").toString()%></a>
                                    </div>
                                </div>
                                    
                                <div class="allpostcontent">
                                    <text><%= ((JSONObject)posts.get(i)).get("message").toString().replace("\n", "<br />") %></text> <br/>
                                <%--
                                    if(u != null){
                                        if(u.getUserId() == posts.get(i).getUser().getUserId() || moderator){
                                    %>
                                        <p style="text-align: right; font-size: 13px;margin-bottom: -15px">
                                            <a href="editpost.jsp?postid=<%=posts.get(i).getPostId()%>&id=<%=request.getParameter("id")%>" style="color:white;">Edit Post</a>
                                        </p>
                                    <%
                                        }
                                    }
                                --%>
                                    <p style="text-align: right; font-size: 13px;">#<%=i+1%></p>
                                </div>
                                
                            </div>
                        <%
                        }
                    %>
                        <%--
                            if(u!=null){
                        %>
                                <div class="form-group">
                                <form action="newPost" method="post"> <br/>
                                    <textarea style="resize:none;background-color:rgb(15,25,40); color:white;" class="form-control" rows="5" id="comment" name="postcontent" placeholder="say something"></textarea><br/>
                                    <input type="submit" class="btn btn-default" style="background-color:rgb(0,100,0);width:25%; color:white; float:right; font-family: lato; font-size: 16px;" value="Post Reply">
                                    <input type="hidden" name="threadid" value="<%= currentThread.getThreadId() %>">
                                </form>
                                </div>
                                <%
                                --%>
                        <%
//                            } else{
                                out.println("Please <a href='login.jsp' style='color:white;'>sign in</a> to post a comment");
//                            }
                        %>
                    </div>
                    <div class="contentthreadright">
                        <div class="contentbox">
                            Date Posted: <%=currentThread.get("publishdatetime").toString()%> <br/>
                            Posts: <%=posts.size()%>
                        </div>
                        <br/>
                        <jsp:include page="rightcontent.jsp" flush="true" />
                    </div>
                    <div style="clear:both"></div>
                </div>
            </div>
            <jsp:include page="footer.jsp" flush="true" />
        </div>
    </body>
</html>
