?{# Mako File: HTML5 Rosebush NIMHLabs template
# File: $(rosebush.path.mako.html5)/main.html.mako
# Author: KatrinaTheLamia <FullMetalHarlot@NIMHLabs> [http://nimhlabs.com NIMH Labs]
# Speil:
# This file is more the frame work of a client rather than a template to put 
# stuff into. Though, nothing is stoping that from occuring either.
#
# The design is meant to be simple. Allowable for a few CSS updates--even user
# CSS can (and may) be added. Possibly with a few "saved" CSS entries for the 
# end user

}
<!DTD html>
<html lang="${rosebush.user.lang}">
<head>
    <meta charset="UTF-8">
    <title>${rosebush.page.title} | ${rosebush.site.name}</title>
    <meta type="engine" contents="Rosebush ${rosebush.version}, ${rosebush.edition}">
    <meta type="author" contents="${Rosebush.page.author.name}">

    <!-- Style Sheet -->
    <link rel="stylesheet" href="${rosebush.user.style}">

    <!-- Style Switches -->
    <link rel="alternative" href=".2.xhtml" type="text/xhtml+xml" title="XHTML 2">
    <link rel="alternative" href=".11.xhtml" type="text/xhtml+xml" title="XHTML 11">
    <link rel="alternative" href=".4.html" type="text/html" title="HTML 401">
    <link rel="alternative" href=".32.html" type="text/html" title="HTML 32">
    <link rel="alternative" href=".2.html" type="text/html" title="HTML 2">
    <link rel="alternative" href=".json" type="text/javascript" title="JSON">
    <link rel="alternative" href=".rest" type="text/xml" title="Contents as a REST File">
    <link rel="alternative" href=".timothy" type="text/lisp" title="Timothy LISP">
    <link rel="alternative" href=".fbml" type="text/x+fbml" title="Facebook Markup">
    <link rel="alternative" href=".geocities.html" type="text/html" title="Geocities">
    <link rel="alternative" href=".96hourday.html" type="text/html" title="Formatted for a ninety six hour day">

    <!-- Updates -->
    <link rel="alternative" href="${rosebush.site.root}/Main.atom" type="appliction/atom+xml" title="Site Atom Feed">
    <link rel="alternative" href="/Main.rss" type="text/rss" title="Site RSS Feed">
    <link rel="alternative" href="./Comments.atom" type="application/atom+xml" title="Comment Atom Feed">
    <link rel="alternative" href="./Comments.rss" type="text/rss" title="Comment RSS Feed">
    <link rel="alternative" href="${rosebush.site.root}/Search.atom?q=${rosebush.page.search_terms}" type="application/atom+xml" title="Query Updates Atom Feed">
    <link rel="alternative" href="${rosebush.site.root}/Search.rss?q=${rosebush.page.search_terms}" type="text/rss" title="Query Updates RSS Feed">
    <link rel="alternative" href="${rosebush.site.twitter}" type="text/html" title="Twitter Account">


    <link rel="author" href="./Author" type="text/html" title="Page Author">
    <link rel="next" href="./Next" type="text/html" title="Next">
    <link rel="prev" href="./Previous" type="text/html" title="Previous">
    <link rel="start" href="${rosebush.site.root}/Search?q=${rosebush.page.search_terms}" title="text/html">

    <link rel="search" href="">
    <link rel="pingback" href=">

    <link rel="shortcut icon" href="${rosebush.page.icon}" type="">

    ${rosebush.site.script.head.html5}
</head>
<body>
    <header id="header">
        <span class="sighted"><a href="#Page_Content">Skip to Content</a></span>
        <span class="reader">Search Page Content: </span>
        <form id="tag_search" method="get" action="${rosebush.site.root}/search">
            <input id="tags" name="tags">
            <button class="script_enabled" onclick="#tag_search">Go!</button>
            <button id="tags" class="script_disabled" type="submit">Go!</button>
        </form>
        <hgroup>
            <h1><strong>NIMH</strong> Labs</h1>
            <h2>Where Intelligence is born</h2>
        </hgroup>
        <span class="reader">Operations Menu</span>
        <nav class="operations">
            <ul>
                <li><a href="${rosebush.site.main}">Main Page</a></li>
                <li><a rel="start" href="${rosebush.site.root}/search?q=${rosebush.page.search_terms}" class="results">Similar Pages</a></li>
                <li><a rel="prev" href="./Previous">Previous</a> <span class="reader">Page</span></li>
                <li><a rel="next" href="./Next">Next</a> <span class="reader">Page</span></li>
                <li><span class="reader">Get a page at </span><a href="${rosebush.site.root}/Random">Random!</a></li>
? if rosebush.site.can_favourite(rosebush.user):
                <li><span class="reader">A list of your follows</span><a href="${rosebush.user.profile.url}/Favourites">Favourites</a><ul>
? if not rosebush.user.has_favourites:
                            <li>No favourites, click the "+" to fav this page</li>
? else
? foreach rosebush.user.favourites as title => link :
                            <li><a href="${link}">${title}</a></li>
? end
? fi
                        </ul></li>
                <li><a rel="nofollow" href="./Favourite">+</a></li>
? fi
                <li><span class="reader">Page </span>Rating: ${rosebush.page.rating}.</li>
                <li><span class="reader">Rate </span><a rel="nofollow" href="./Like">Up</a></li>
                <li><span class="reader">or Rate </span><a rel="nofollow" href="./Dislike">Down</a></li>
            </ul>
        </nav>
        <nav class="share">
<!-- need to add my share stuffs into here -->
        </nav>
        <span class="search script_enabled">${rosebush.page.search_terms}</span>
    </header>
    <article id="article">
        <a name="Page_Content">&nbsp;</a>
        <nav class="script_enabled">
            <span class="to_full_size">
                <a href="#full_size">500 Charaters</a>
            </span>
            <span class="to_console_size">
                <a href="#console_size">79 Characters</a>
            </span>
        </nav>
${rosebush.page.payload.html5}
<span class="reader">And now, a word from our sponsors: </span>
${rosebush.site.advertisements.article_bottom.html5}
    </article>
    <section>
${rosebush.site.advertisements.side.html5}
    </section>
    <span class="reader">Anything below here is just going to be confusing or annoying. You may want to stop the reader.</span>
    <nav id="tags">
        <ul class="tags list">
? foreach rosebush.page.tags as name, value:
            <li><a rel="tag" href="${rosebush.site.tags}/${name}">$name</a></li>
? end
        </ul>
? if rosebush.page.can_tag(rosebush.user):
        <form id="tag_add" method="${rosebush.page.tagging.url}">
            <input id="tag_to_add" name="tag_to_add" default="Tagme">
            <button class="script_enabled" onclick="#tag_add">Tag!</button>
            <button id="tags" class="script_disabled" type="submit">Tag</button>
        </form>
? fi
    </nav>
    <aside id="word_cloud">
        <ul>
? foreach rosebush.page.important_words as word, value:
            <li class="value">word</li>
? end
        </ul>
    </aside>
? if (not rosebush.page.has_comments and rosebush.site.defaults.can_view_comment(rosebush.user)) or rosebush.page.comments.can_view():
    <aside id="comment">
? if rosebush.page.has_comments :
${rosebush.page.comments.html5}
? fi
? if rosebush.page.can_comment(rosebush.user):
        <form id="user_comment" method="post" action="${rosebush.page.comment.url}">
             <textarea id="user_comment_content" class="comment"></textarea>
             <button class="script_enabled" onclick="#comment">Post</button>
             <button id="comment" class="script_disabled" type="submit">Post</button>
        </form>
? fi
    </aside>
? fi
    <aside id="author_info">
${rosebush.page.author.page.payload.abbr.html5}
    </aside>
    <aside id="page_statistics">
${rosebush.page.statistics.html5}
    </aside
? if rosebush.page.has_annotations and rosebush.page.annotations.can_view(rosebush.user):
    <div id="annotations">
${rosebush.page.annotations.html5}
    </div>
? fi
? if rosebush.page.can_edit(rosebush.user):
    <div id="edit">
${rosebush.page.edit.widget}
    </div>
? fi
    <nav class="navi user interactions">
        <ul>
            <li><a href="#Tags">Tags</a><li>
            <li><a href="#Word_Cloud">Word Cloud</a></li>
            <li><a href="#Comments">Discuss</a></li>
        </ul>
    </nav>
    <nav class="navi user menu">
        <ul>
? if not rosebush.user.account :
            <li><a href="/login" onclick='page.location="#login"; return true;'>Login</a>${rosebush.engine.login_links.html5}</li>
? else :
            <li><a href="${rosebush.user.profile.url}">My Account</a></li>
? fi
? if rosebush.page.can_edit(rosebush.user):
            <li><a rel="edit" href="./Edit" onclick='page.location="#edit"; return true;'>Edit</a></li>
? fi
? if rosebush.site.has_flags and rosebush.user.can_see_flags(rosebush.site.flags) :
            <li><a href="./Flags" onclick='page.location="#flags"; return true;'>Flags</a></li>
? fi
? if rosebush.site.has_queue and rosebush.user.can_approve(rosebush.site.queue):
            <li><a href="./Queue" onclick='page.location="#queue"; return true;'>Queue</a></li>
? fi
? if rosebush.page.has_history and rosebush.page.history.can_view(rosebush.user) :
            <li><a href="./History">Page History</a></li>
? fi
? if rosebush.page.can_delete(rosebush.user) :
            <li><a href="./Delete" onclick='page.location="#delete"; return true;'>Delete</a></li>
? fi
? if rosebush.page.has_comments and rosebush.page.comments.can_view(rosebush.user):
            <li><a href="#Comments">Comments (${rosebush.page.comments.count})</a></li>
? else:
            <li>No Comments</li>
? fi
? if rosebush.page.can_comment(rosebush.user) :
            <li><a href="./Comments/Add" onclick='page.location="#Add_Comment"; return true;'> + </a></li>
? fi
? if rosebush.page.has_annotations and rosebush.page.annotations.can_view(rosebush.user):
            <li><a href="./Annotatins" onclick='page.location="#Add_Annotation"; return true;'>Annotations</a></li>
? else:
            <li>No Annotations</li>
? fi
? if rosebush.page.can_annotate(rosebush.user):
            <li class="ecma_enabled"><a href="#Annotate">+</a></li>
? fi
            <li class="informative author"><a href="./Author" onclick='page.location="#Author"; return true;'>About Author</a></li>
            <li class="informative page"><a href="./Statistics" onclick='page.location="#Statistics"; return true;'>This Page</a></li>
        </ul>
    </nav>
    <footer id="footer">
${rosebush.site.logo.html5}
${rosebush.site.sections.html5}
        <nav class="Rosebush">
            <h2><a href="${rosebush.engine.project.main.url}">Rosebush</a></h2>
            <ul>
                <li><a href="${rosebush.engine.project.documentation.url}">Documentation</a></li>
                <li><a href="${rosebush.engine.project.download.source.url}">Source Repository</a></li>
                <li><a href="${rosebush.engine.project.contributors.url}>Contributors</a></li>
                <li><a href="${rosebush.engine.project.donate.url}">Please Donate</a></li>
            </ul>
        </nav>
${rosebush.site.contact.html5}
    </footer>
${rosebush.page.script.optimised.html5}
</body>
</html>
