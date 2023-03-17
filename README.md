# QurbaTask_2

This Task is created for the role of iOS Engineer @ Pleny BY Mahmoud Mostafa
Few Things to consider:
1. the Images in the app were statically placed rotating between 3 different images randomly, this is why: A. if you clicked on an image in the feed to view it then closed the view. the order of the images in the feed changes.
2. The Usernames in the feed are also statically placed this is because of an error in the DummyJSON API A. In Post Number '9' the userID is '42'. This is wrong because there's only 30 users registered in the API. B. So the call produces an "INDEX OUT OF RANGE' error
3. There's a bug in the app in the login screen. You have to click twice on 'Login Button' A. First one to authenticate user creditentials B. if authenticated, click again to be transported to main page
4. To use the search feature -> search top right from home -> enter text in textfield -> press search on the left
5. Everything in the Tech Stack was deployed except for the Repository Patten
6. Thank You for the opportunity =)

------- This is an scerpt from the API call for POSTS ------- 
"id": 9, 
"title": "There are different types of secrets.",
"body": "There are different types of secrets. She had held onto plenty of them during her life, but this one was different.
She found herself holding onto the worst type. It was the type of secret that could gnaw away at your insides if you didn't tell someone about it,
but it could end up getting you killed if you did.", 
"userId": 42, ------------->>>>>>> ERROR 
"tags": [ "american", "history", "magical" ], 
"reactions": 2 
------- This is an scerpt from the API call for POSTS -------
