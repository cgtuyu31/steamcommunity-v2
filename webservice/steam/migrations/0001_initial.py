# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-01 13:06
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Discussion',
            fields=[
                ('discussionid', models.AutoField(db_column='discussionID', primary_key=True, serialize=False)),
                ('gamename', models.CharField(max_length=50)),
                ('description', models.TextField()),
                ('imgurl', models.CharField(max_length=256)),
            ],
            options={
                'db_table': 'discussion',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Friends',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField()),
            ],
            options={
                'db_table': 'friends',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('postid', models.AutoField(db_column='postID', primary_key=True, serialize=False)),
                ('message', models.TextField()),
                ('postdatetime', models.DateTimeField(db_column='postDateTime')),
                ('updatedatetime', models.DateTimeField(db_column='updateDateTime')),
            ],
            options={
                'db_table': 'post',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Thread',
            fields=[
                ('threadid', models.AutoField(db_column='threadID', primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=50)),
                ('publishdatetime', models.DateTimeField(db_column='publishDateTime')),
                ('ispinned', models.IntegerField(db_column='isPinned')),
                ('categorytype', models.IntegerField(db_column='categoryType')),
            ],
            options={
                'db_table': 'thread',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('userid', models.AutoField(db_column='userID', primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=30)),
                ('password', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=30)),
                ('imageurl', models.CharField(db_column='imageURL', max_length=256)),
                ('description', models.CharField(max_length=256)),
                ('name', models.CharField(max_length=100)),
                ('country', models.CharField(max_length=100)),
                ('province', models.CharField(max_length=100)),
                ('city', models.CharField(max_length=100)),
                ('joindate', models.DateTimeField(db_column='joinDate')),
            ],
            options={
                'db_table': 'user',
                'managed': False,
            },
        ),
    ]
