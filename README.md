## Dromotherm

site for dromotherm.fr

http://dromotherm.github.io/blog

## Reminder - how to write posts

Posts are stored in the [_posts directory](/_posts)

A new post must be named :	AAAA-MM-DD-name_bla_bla.markdown

The file must start with a metadatas header
```
---
layout: post
title:  "Welcome !"
date: AAAA-MM-DD
categories: [project management, other category]
---
```
Date and categories are optional

The post has to be written in the markdown syntax
```
# title
## subtitle
```

Insert a link :
```
[text - description of the link](http://www.cerema.fr)
```

Images are to be stored in the [assets directory](/assets)

To upload a new image

To insert a new image in a post, in a responsive manner (ie for mobile and desktop client)
```
![image description]({{ site.baseurl }}/path/to/image){:class="img-responsive"} 
```
For example /path/to/image can be `/assets/smartgrid.png`
