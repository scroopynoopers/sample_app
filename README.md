== README

This site was designed by me, Lee, as a sample project for Launchcode. The basic framework of the site, as a Twitter or microblog-esque website, was developed through the use of the Ruby on Rails Tutorial by Michael Hartl, but I have done substantial work to the site on my own to make it 'mine'.

This site has the following features:

* Users may create short posts (microposts) limited to 140 characters or less, similar to Twitter. In addition, they can upload images.

* Users may follow and unfollow each other, as well as up- and down-vote each other's posts.

* Email authentication for account activation and password resets.

* Responsive design via the use of Bootstrap, enabling the site to resize itself to display coherently on any device.

* A working upvote and downvote system via the use of the acts_as_votable gem. 

* Asynchronous requests through the use of JQuery-- when a post is submitted, deleted, voted upon, or contains an image upload, it will be displayed real-time on the site without the need for an automatic refresh of the page. 

This site has been deployed and exists on the live web as: http://salty-chamber-92917.herokuapp.com
