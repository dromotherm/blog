# Assets customization

## hosting font awesome

https://fontawesome.com/how-to-use/on-the-web/setup/hosting-font-awesome-yourself

the fontawesome-free-5.11.2-web.zip file is structured as follow :
```
css
 |_ all.css
 |_ .......
js
less
metadata
scss
sprites
svgs
webfonts
```

to implement self hosting, all.css and the entire webfonts dir are to be injected in the static assets folder :

```
assets
  |_ scss
     |_ main.scss
     |_ all.css
  |_ webfonts
```

Then modify the `<head></head>` section of _includes/head.html so that it contains :
```
<link rel="stylesheet" href="{{ "/assets/css/all.css" | relative_url }}">
```

other option is to use scss :

https://fontawesome.com/how-to-use/on-the-web/using-with/sass
