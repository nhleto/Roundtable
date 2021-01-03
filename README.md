<h1>Roundtable</h1>

<p>Written with Ruby on Rails, my social media site, Roundtable, has many of the quality-of-life features expected of a modern social media app. This fullstack application uses PostgreSQL on the backend, to allow for the meaningful database that makes relational databases so powerful. This has become my go-to database over the past couple of months, to ensure a smooth transition from production to deployment (heroku.com). The backend also features Ruby on Rails, the Ruby framework I have grown comfortable with thanks to its user-friendliness and “Rails magic”. I styled the front end using Bulma, a CSS framework, that allowed my site to smoothly transition from a blank page to the clean user-facing style it now has. And although Bulma was helpful in general layout, the majority of Roundtable was written with hand-rolled CSS, to fill in the gaps Bulma couldn't reach (animated notification badges, flash-messages, and all manner of smaller details). As my site started to flesh out, I found myself needing more and more Javascript functionality, including: dropdown menus, user bio character count, and responsive navbar. Roundtable uses vanilla Javascript to bring my website to life and allow it to smoothly show the more dynamic features of the site.</p>

<h4>Roundtable features:</h4>
<ul>
  <li>User’s can make posts and can comment on those posts.</li>
  <li>Comments and be liked and replied to by other users (nested comments).</li>
  <li>Users can see who liked a post or comment and add them as a friend or visit their profile from a dropdown menu.</li>
  <li>Users can send friend requests to other users.These can be accepted or declined.</li>
  <li>User’s have profiles and profile-pictures (Rails Active Storage - avatars default to a Gravatar if no picture is attached) and users can upload a photo of their choice on  sign-up or from their profile page.</li>
  <li>Users can create Groups and post directly to that group in a separate feed.</li>
  <li>Groups have one owner, many admins, and many users. The group owner can promote users to admins. Group owners and admins can edit group data (name, description, group photo).</li>
  <li>Posts in a group feed have the same functionality as posts in the main feed (comments, nested comments, likes).</li>
  <li>Implemented Google and Github API to allow users to create a profile on Roundtable from their Google or Github account.</li>
</ul>


<h4>Tech used:</h4>
<ul>
  <li>Ruby v2.7.2</li>
  <li>Ruby on Rails v5.2</li>
  <li>Bulma v0.9.0</li>
  <li>PostgreSQL v12.4</li>
  <li>Javascript(ES6)</li>
</ul>
