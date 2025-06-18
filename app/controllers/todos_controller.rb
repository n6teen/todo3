class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @todos = Todo.order(created_at: :desc)
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params.merge(status: false))
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todo_url(@todo), notice: "Quest was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to root_path, notice: "Quest updated successfully." }
        format.json { render json: { status: @todo.status, message: "Quest updated successfully" }, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy!
    respond_to do |format|
      format.html { redirect_to todos_path, status: :see_other, notice: "Quest was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:title, :status)
    end
end
