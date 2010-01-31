<!DTD html>
<html lang="en">
    <head>
         <meta charset="UTF-8">
         <meta name="application-name" content="$(rosebush.engine.name)/$(rosebush.entry.plugins)">
         <meta name="author" content="$(rosebush.entry.authors.plain)">
         <meta name="description" content="$(rosebush.entry.summary.twit)">
         <meta name="audience" content="$(rosebush.entry.audience)">
         $(rosebush.site.creators.html5)
         <meta name="audience" content="$(rosebush.site.publisher)">
         <meta name="rob-KidNorrin" content="$(rosebush.entry.Norrin_directives)">

         <title>$(rosebush.entry.title) | $(rosebush.site.name)</title>

         <link rel="stylesheet" href="$(rosebush.user.setting.stylesheet)">

         $(rosebush.entry.authors.html5)

        <link rel="shortcut icon" href="$(rosebush.entry.icon.url)" type="$rosebush.entry.icon.type" sizes="$(rosebush.entry.icon.sizes)">
#if rosebush.site.has_twitter
        <link rel="alternate" href="$(rosebush.site.twitter.url)" type="text/html" title="$(rosebush.site.twitter.description)">
#fi
#if rosebush.site.has_hashtags
#    for hashtag in rosebush.site.hashtags
        <link rel="alternate" href="$(hashtag.gen_url())" type="text/html" title="$(hashtag.description)">
#    end
#fi
#if rosebush.entry.has_irc
        <link rel="alternate" href="$(rosebush.entry.irc.room.url)" type="text/plain" title="$(rosebush.entry.irc.room.description)">
#fi
#if rosebush.engine.has_web_irc
        <link rel="alternate" href="$(rosebush.engine.web_irc.gen_url(room=rosebush.entry.irc.room.url))" type="text/html" title="$(rosebush.site.web_irc.description)">
#fi



#if rosebush.engine.has_local_modernizr
       <script src="$(rosebush.engein.modernizr.local.url)">
#else
       <script src="$(rosebush.engine.modernizr.foreign.url)">
#fi

#if rosebush.engine.has_local_html5shiv
       <!--[if IE]><script src="$(rosebush.engine.html5shiv.local.url)"></script><![endif]-->
#else
       <!--[if IE]><script src="$(rosebush.engine.html5shiv.foreign.url)"></script><![endif]-->
#fi
    </head>
    <body>
$(rosebush.entry.mast)
$(rosebush.entry.output.html5)
$(rosebush.site.footer)
    </body
</html>
