# Dromotherm

site for www.dromotherm.com or http://dromotherm.github.io/blog

There is a ruby script generating pages for each thematic categories.

## Reminder - how to write posts

### deposit place
Posts are stored in the [_posts directory](/_posts)

### name and metadatas
A new post must be named :	AAAA-MM-DD-name_bla_bla.markdown

The file must start with a metadatas header
```
---
layout: post
title:  "Welcome !"
author: surname
draft: false
lang: "en"
ref: something
date: AAAA-MM-DD
categories: [dromotherm, project management, other category]
image: energy_plus/acf_2.png
---
```
The author field is used to make the link with staff-members, as defined in the [_staff-members](/_staff-members) directory. In pratice, the software scans the _staff-members directory to find files whose metadatas header includes a ref field equal to the value that the post writer has given to the author field. 
If the surname given in the post as no corresponding file in the _staff-members directory, the post will nevertheless be available for reading

The lang field can be "fr", "en" or even something else. Make sure that the whole text of the post is in a single language.

If you don't want your post to be available in another language, just write a single file.

If you want a specific post to be available in french and english, you will have to create two files : 
- AAAA-MM-DD-name.markdown
- AAAA-MM-DD-nameEn.markdown

**DO NOT USE A REFERENCE THAT COULD BE THE NAME OF A CATEGORY !!!**
 
It is essential that both files have the same ref in the metadatas section

```diff
+ if you want your post to appear on front page, be sure to add `dromotherm` to the categories field
+ Dans ce cas il faut ajouter une image dans la section de métadonnées:
+ image: master/trophee.jpg
+ ATTENTION, la largeur de l'image doit être le double de sa hauteur
+ Pour bien apparaitre sur la front page, utiliser une image de taille 450 par 220
+ La première phrase du post doit être courte, justement pour tenir sur les 2 premières lignes de la card, en dessous de l'image
```


date and draft fields are optional

if draft is set to true, the post will be considered as a work in progress and will not be published online. Once you remove the draft field or set it to false, the post is pushed to the site by the jekyll engine

### structure

The post has to be written in the markdown syntax

```
# title
## subtitle
```

### Insert a link :
```
[text - description of the link](http://www.cerema.fr)
```

### Manage and insert images

Images are to be stored in the [assets directory](/assets)

To upload a new image with the github web UI
![upload new image via UI 1](/assets/doc/upload_illustration_1.png)
![upload new image via UI 2](/assets/doc/upload_illustration_2.png)

To insert a new image in a post, in a responsive manner (ie for mobile and desktop client)
```
![image description]({{ site.baseurl }}/path/to/image){:class="img-responsive"} 
```
For example /path/to/image can be `/assets/smartgrid.png`


## Multilingual adaptation

Multilingual adaptation was realized with the help of the following article which describes a simple and elegant solution :

https://www.sylvaindurand.org/making-jekyll-multilingual/

the models have been adapted to be language sensitive

## Downloadable content

downloadable files are dynamically managed

Just drop them in :

[/assets/downloads/en](/assets/downloads/en) for documents written in english

[/assets/downloads/fr](/assets/downloads/fr) for documents written in french
