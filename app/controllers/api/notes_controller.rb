class Api::NotesController < ApplicationController

    before_action :set_note, only: [:show, :update, :destroy]


    def index
        render json: Note.all
    end

    def show
        render json: @note
    end

    def create 
        @note = Note.new(notes_params)
        if(@note.save)
            render json: @note
        else
            render json: {errors: @note.errors.full_messages}, status: 422
        end
    end

    def update
        if (@note.update(notes_params))
        render json: @note
        else 
            render json: {errors: @note.errors.full_messages}, status: 422
     end
    end

    def destroy 
       render json: @note.destroy
    end

    private

    def notes_params 
        params.require(:note).permit(:title, :content)
    end

    def set_note
        @note = Note.find(params[:id])
    end

end
