defmodule ResumeGeneratorWeb.Router do
  use ResumeGeneratorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ResumeGeneratorWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # TODO: implement standard CRUD
    # get "/resumes", ResumeController, :index
    get "/resumes", ResumeController, :show
    # get "/resumes/id", ResumeController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ResumeGeneratorWeb do
  #   pipe_through :api
  # end
end