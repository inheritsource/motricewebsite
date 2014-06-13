   jQuery(function($){
        $(".tweet").tweet({
        username: "InheritSAB",
        avatar_size: 16,
        count: 3,
        loading_text: "hämtar tweets...",
        template: "{avatar}{join}{text}<p>{time}{retweet_action}</p>"
        });
    });
 