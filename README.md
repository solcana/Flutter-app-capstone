# Flutter-app 🦋

Be the social butterfly of travel!

---

## About

Flutter 🦋 is a Travel Log web application that allows users to create and share their travel logs and interact with other users via comments on travel logs. This is a solo full stack project built using Ruby on Rails over a period of 5 days.

---

## 👾 Link

Deployed version here: https://sleepy-meadow-60791.herokuapp.com/users/sign_in

---

## 🙇‍♀️ Timeframe and Working Team

Solo project, built over a period of 5 days. 

---

## 🤖 Getting started / Code installation

- Clone or download repo $ git clone https://github.com/your-username/your-project-name.git
- Navigate into project directory $ cd your-project-name
- Install project dependencies using Bundler $ bundle install
- Setup the database $ rails db:setup
- Start the rails server and open browser to see app $ rails server

---

## 💻 Technologies Used

- Ruby 3.2.1
- Rails 7.0.4
- Postgresql, for the database
- Puma as the web server
- Turbo-Rails for Hotwire's SPA-like page accelerator
- Stimulus-Rails for Hotwire's modest JavaScript framework
- Devise for authentication
- Bootstrap 5.2.3 for styling
- Heroku for deployment

---


## 🖊 Brief

- Build a full stack web application. Must be your own work
- Select a Project Idea of your own
- Have at least 2 models (more if it makes sense)
    - Auth is a requirement
- Have full CRUD on at least one of your models
- Be able to Add/Delete on any remaining models
- Have high quality code:
    - Follow accepted naming conventions
    - Consistent indentation
   - Well-structure and readable code
   - Semantic naming of variables, functions, CSS classes, etc
   - Short and clear functions that do one thing
   - Efficient code - if you have your MVP, refactor
   - DRY (Don’t repeat yourself) code
- Use one of these technology stacks. You may choose which tech stack
   - Full-Stack Rails App
   - Rails API with React Front-End
   - Express API with React Front-End
- Be deployed on Heroku or similar platform
- Craft a readme.md file that explains your app

---

## 👀 Planning

I started the process by sketching out the models, their attributes and relationships between each other. Then moved on to the wireframes and user stories. Below you can find attached my erd, wireframes and user stories. After finishing these, I moved on to building the app.

In my ERD below, there are four models, where a user can have zero or many travel logs, and zero to many comments, where each comment belongs to a specific user. A log belongs to a specific user and only one destination (beach, forest, mountain or city). A log can also have zero or many comments.


#### ERD
![ERD](readme_img/erd.png)

#### Wireframes
![Wireframes](readme_img/1.png)
![](readme_img/2.png)
![](readme_img/3.png)
![](readme_img/4.png)
![](readme_img/5.png)

#### Preview

![Preview](readme_img/Screenshot%202023-03-10%20at%2011.00.38.png)

#### User Stories

- As a user I want to be able to login, so that I can access my profile
- As a user I want to be able to sign up, so that I can start using the travel app
- As a user I want to be able to view the feed, so that I can see all most recent travel logs, including mine and other people's
- As a user I want to be able to add a travel log, so that I can view it in my logs and feed
- As a user I want to be able to edit a travel log, so I can keep it up to date
- As a user I want to be able to delete a travel log, so I can keep my logs up to date
- As a user I want to be able to view all travel logs, so I see all my travel history
- As a user I want to be able to delete my profile, so I can remove my profile from this app
- As a user I want to be able to navigate to each page, so that I can go to and use any page
- As a user I want to be able to add comments under any log, so I can interact with other users via comments
- As a user I want to be able to delete my comments, so I can remove it from the comments section
- As a user I want to be able to click on the destination link (beach, lake, city or mountain), and get redirected to the page with all associated travel logs, so that I can view all associated travel logs

---

## 👩‍💻 Build / Code Process

- I started off by creating the schema for the Travel Log model. There I defined the fields and their data types for the travel log. After creating the travel log model, I did the same with the destination model. At this point I realised that I needed to install devise gem for authentication before creating the user model. So after installing that, I tested it to ensure it worked, and then created the user model. I established all the relations between my model as explained in my ERD.

```
 create_table "destinations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "travel_logs", force: :cascade do |t|
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "destination_id", null: false
    t.string "title", limit: 100
    t.string "category"
    t.index ["destination_id"], name: "index_travel_logs_on_destination_id"
    t.index ["user_id"], name: "index_travel_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
```

- Next step was to create a starter seed file that I would use to test my model relations, routes and views. I tested the seed file and the relations in my rails console.
- I then defined the RESTful routes for the travel log by using the inbuilt method in Ruby on Rails ‘resources’. 
- After finishing with my schema, seed file, and routes, I kicked off by creating the controller for the travel log, which would include the CRUD (Create, Read, Update, Delete) needed to handle the CRUD operations for the travel log (the model in my app that had the full CRUD).

```

  def index
    @travel_logs = TravelLog.order(created_at: :desc).limit(10)
    # TravelLog.order(created_at: :desc).limit(10) -> displays most recent logs, limited to a 10 per page
  end

  def show
  @travel_log = TravelLog.find(params[:id])
  @comments = @travel_log.comments
  @comment = Comment.new
  @current_user = current_user
  end

  def my_logs
    @travel_logs = current_user.travel_logs.order(created_at: :desc)
  # Show most recent logs by a specific user when user goes to My Logs
  end

  def new 
    @travel_log = TravelLog.new
  end

  def create
    destination = Destination.find_by(category: travel_log_params[:category])
    @travel_log = current_user.travel_logs.create!(travel_log_params.merge(destination: destination))
    redirect_to travel_logs_path
  end
```

- I then started off working on the front end part by creating the views for the travel log. I first created the index.html.erb to show all travel logs, followed by the my_logs.html.erb to show the specific travel logs to that user. I used a partial for this to make the code cleaner. After testing the views for that in my app, I added the other views and methods in the controller, including the form (new and create), edit, and delete method.

```
<div class="card-deck travel-log-card">
  <% @travel_logs.each do |travel_log| %>
    <div class="card">
       <%= link_to travel_log_path(travel_log) do %>
      <%= image_tag(travel_log.image, alt: travel_log.title, class: "card-img") %>
      <% end %>
      <div class="card-body">
        <h5 class="card-title"><%= travel_log.title %></h5>
        <h6 class="card-subtitle mb-2 text-muted">
          <%= link_to travel_log.destination.category.capitalize, destination_path(travel_log.destination.category) %>
        </h6>
        <p class="card-text"><%= travel_log.description %></p>
        <p class="card-text"><small class="text-muted"><%= travel_log.user.username %></small></p>
         <p class="card-text"><small class="text-muted"><%= travel_log.created_at.strftime("%d %B, %Y") %></small></p>

        <% if travel_log.user == current_user %>
          <%= link_to "Edit Travel Log", edit_travel_log_path(travel_log), class: "btn btn-primary" %>
           <%= link_to "Delete Travel Log", travel_log_path(travel_log), data: { turbo_method: :delete, turbo_confirm: "Are you sure you want to delete this travel log?" }, class: "btn btn-danger" %>
        <% end %>
      </div>
    </div>
  <% end %>
</div>
```

- After testing all of my methods and views for the travel logs using my seed file and newly created routes, I moved on to the next models. I followed the same pattern for the destinations and users model. I only needed the index and show methods for the destination model, so I proceeded with that first. And for the user model, I only needed the destroy and the show method, so I finished that before moving on to the next part. 
- After completing the backend and frontend (views) for my app, I kicked off with the styling bit. I used Bootstrap for this to increase efficiency and make sure I deliver the project in a timely manner. I used Bootstrap’s navbar, the cards (to display my travel logs) and buttons. I linked my routes with the buttons on my navbar just like in most common apps these days. 
- The last bit I started working on after I realised I have some extra time on my hands was to add another model in - comment model. I followed the steps I did for the other models and decided to challenge myself a bit with working with nested routes, so I nested my comments into my travel logs routes. This proved to be a bit more challenging than I thought, and had some troubles getting my routes to work for both delete and edit. At the end, I managed to get the delete bit done, but the edit is yet to be completed.

```
resources :travel_logs do
    resources :comments
  end
```

```
class CommentsController < ApplicationController
  def create
    @travel_log = TravelLog.find(params[:travel_log_id])
    @comment = @travel_log.comments.create(comment_params)
    redirect_to travel_log_path(@travel_log)
  end

  def destroy
   @travel_log = TravelLog.find(params[:travel_log_id])
   @comment = @travel_log.comments.find(params[:id])
   @comment.destroy
  redirect_to travel_log_path(@travel_log)
  end

  def update
    @travel_log = TravelLog.find(params[:travel_log_id])
    @comment = @travel_log.comments.find(params[:id])
    @comment.update(comment_params)
      redirect_to travel_log_path(@travel_log)
    end

  private
    def comment_params
     params.require(:comment).permit(:content, :user_id)
    end
end

```

- Last step was deploying my app which I did using the Heroku hosting service. I did get some errors at first before being able to figure it out (stack overflow to the help).

---

## 🥲 Challenges

Biggest challenge, as with all other projects, was building a full, workable app, in a limited amount of time, solo, using something relatively new to me. It was difficult integrating all these concepts in my head and making them connect together and get the full puzzle - and it still is! Because of this, it was also challenging estimating how much time I’d need on each section, which is what gave me a bit of anxiety throughout the project. To overcome these challenges, I used various tools I had available, including the most obvious - googling, stack overflow, reviewing class videos and labs and seeking help when necessary.

---

## 🏆 Wins

Working with Ruby on Rails overall felt like a win compared to the other projects we did during the course. It felt most intuitive to me and even though challenging, it was most enjoyable working with this language and I felt a sense of accomplishment with every finished working feature. 

I felt I did best with what I had at hand in terms of my visual design of the project, but as mentioned in the future improvement section, I would improve it more if I had more time to work on it.

---

## 🫡 Key Learnings / Takeaways

Out of all other languages and tools learned throughout the bootcamp, I can definitely say, I feel most confident about using Ruby on Rails to build a full-stack project, and I’m looking forward to practising more of it!
And as with all projects, the key takeaway is practice, practice, practice! Only that way you can learn the intricacies of a language. 


---


## 🐞 Bugs

- The comment edit section is not workable at the moment

---

## ✨ Future Improvements

- Add functionality to the comments section
- Improve the styling and layout of the comments section
- Create a user profile path where user can see, edit their information & delete profile
- Add Maps API to show geographical locations of the travels
- Add more destination types 
- Search functionality to be able to search by keywords, such as destination type, or location names
