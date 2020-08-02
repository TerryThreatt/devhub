# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    - initialized project with 'rails new'
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - User has_many projects, project_tasks
    - Project has_many project_tasks
    - Task has_many projects, project_tasks
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Project belongs_to :user
    - ProjectTask belongs_to :user, :project, :task
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - User has_many :tasks, through: :project_tasks
    - Task has_many :users, :projects, through: :project_tasks
    - Project has_many :users, :tasks, through: :project_tasks
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - User has_many :projects, through: :project_tasks && Project has_many :users, through: :project_tasks
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - ProjectTask.due_date || ProjectTask.done?
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - User validates :username, :email, :password, presence: true
    - Task validates :name,  presence: true
    - Project validates :name, :due_date, presence: true
    - ProjectTask validates :name, :due_date, presence: true
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - ProjectTask.asc || ProjectTask.desc || ProjectTask.done_count
- [x] Include signup (how e.g. Devise)
    - Devise
- [x] Include login (how e.g. Devise)
    - Devise
- [x] Include logout (how e.g. Devise)
    - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - omniauth-google-oauth2'
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate