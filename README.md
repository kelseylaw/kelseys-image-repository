# Shopify Developer Intern Challenge - Summer 2020

## Project: The Cat Gallery
The task for the challenge was to build an image repository, so I built an image gallery web application that lets users upload and view images on their accounts. I figured it might be a little boring to make a generic image gallery, so I decided to call it The Cat Gallery just to make the content a little more interesting!

The Cat Gallery supports multiple user profiles with login/logout functionality, each with the ability to upload of local JPG, JPEG, PNG, and GIF images to the web app, and labelling the images with titles and descriptions, and setting them for public or private viewing. These images can be viewed individually, edited, and deleted from the app. The Cat Gallery also has a public Image Gallery, where users (and even non-users!) can view others' uploaded photos that have been marked as public, as well as basic filtering of public images by title, description, and uploader's username.

## Technologies Used
I've used **Ruby on Rails** at my previous internship, but never within my own projects, so I wanted to take this opportunity to learn how to use Rails to create a web app from scratch. Here are some of the technologies and gems that I used to create The Cat Gallery:

- Ruby on Rails
- SQLite for database management
- Bootstrap for FE components
- bcrypt for password hashing
- MiniMagick for resizing images
## Locally running the application
1. Clone this repository
2. In the root of this project, run:
```
yarn install
rails db:migrate
rails s
```
3. Access the web application via localhost and enjoy!

## Endpoints
| Resource/Route    | GET                                                                                              | POST                       | PATCH                          | DELETE                            |
|-------------------|--------------------------------------------------------------------------------------------------|----------------------------|--------------------------------|-----------------------------------|
| /                 | The root route, renders the homepage                                                             |                            |                                |                                   |
| /images           | Returns all public Image records with filters applied (if available), renders Image Gallery page | Creates a new Image record |                                |                                   |
| /images/show      | Renders the page for viewing a selected Image record                                             |                            |                                |                                   |
| /images/new       | Renders the form for creating a new Image record                                                 |                            |                                |                                   |
| /images/:id/edit  | Renders the form for editing an existing Image record                                            |                            |                                |                                   |
| /images/:id       | Returns the selected Image record, renders the selected Image page                               |                            | Edits an existing Image record | Destroys an existing Image record |
| /users            | Redirects to GET /users/new                                                                      | Creates a new User record  |                                |                                   |
| /users/show/:id   | Renders the page for viewing a user profile                                                      |                            |                                |                                   |
| /users/new        | Renders the form for creating a new User record                                                  |                            |                                |                                   |
| /users/:id/edit   | Renders the form for editing an existing User record                                             |                            |                                |                                   |
| /users/:id        | Returns the selected User record, renders the selected User page                                 |                            | Edits an existing User record  |                                   |
| /sessions/new     | Renders the login page                                                                           |                            |                                |                                   |
| /sessions/create  | Authenticates the user in if info is correct, logs the user in                                   |                            |                                |                                   |
| /sessions/destroy | Logs the user out of the application                                                             |                            |                                |                                   |
| /profile          | Redirects to GET /user/show/:id, where :id is the current user's id                              |                            |                                |                                   |
| /register         | Redirects to GET /users/new                                                                      |                            |                                |                                   |

## Rationale
- I decided to use Ruby on Rails to build my application, as I've had experience with using Rails on Rails in a work setting, but I've never tried to create a Rails application from scratch, and because I know that Shopify uses Rails as well.
- I didn't just want to create an API for this challenge, as I wanted to have fun with creating a front-end for such a visual-based application (it _is_ an image repository, after all!). However, due to time constraints I decided to make use of Bootstrap components. 
    - I've used Bootstrap very lightly with Javascript/Typescript before, but I know that Rails also has a gem that allows for Bootstrap integration, so I deicded to learn and give it a try.
- I considered using a database solution other than the default SQLite that's initialized with the rails project (like MongoDB or PostgreSQL). Weighing the amount of time I had, and the relative simplicity of the models I would be using, I decided to use the default SQLite client
- I definitely wanted to incorporate some sort of authentication/security feature into the application, as I'm not really familiar with security/authentication tools in general, so I used bcrypt as a simple solution for password hashing

## Things I'm happy with about this project
- I learned a whole lot about using Rails from scratch, as well as understanding routing and integration of different gems within Rails - I also learned and did a decent job of using Bootstrap in conjunction with .erb files for creating a simple front-end interface.
- I exceeded my expectations for the amount of functionality I could add to the application. My initial goal was to complete user login/logout as well as image CRUD functions, but I was also able to add some simple filtering functionality and public/private designations for images.

## Things that could definitely be improved
- As I was learning a whole bunch of different technologies all at once, I approached this project a little closer to a hackathon-style project than I would prefer, in that there are few specs outside of the generated specs, as I wasn't able to get mocking and stubbing with Rails' default test helpers working in time.
- I would have liked more consideration and time spent on the API endpoints, as I focused a lot of attention on directly using my endpoints to support the web application.

## Things I would have loved to add to the application if I had more time
- Support for multiple-image uploading
- Seeded data so that someone who clones my repo has example data on the app from the start
- Grid view for viewing images instead of a tabular format
- More complex filtering and querying for images
- Support for profile photos
- A less basic front-end, more customization (more cats?)