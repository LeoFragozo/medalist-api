# frozen_string_literal: true

module Api
    module V1
      class AthletesController < ApplicationController
        def index
          athletes = Athlete.order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Atletas carregados', data: athletes },
                 status: :ok
        end
  
        def show
          athlete = Athlete.find(params[:id])
          render json: { status: 'SUCCESS', message: 'Atletas carregados', data: athlete },
                 status: :ok
        end
  
        def create
          athlete = Athlete.new(athlete_params)
           if athlete.save
              render json: {status: 'SUCCESS', message:'Atleta salvo', data:athlete},status: :ok
           else
             render json: {status: 'ERROR', message:'Atleta não salvo', data:athlete.erros},status: :unprocessable_entity
          end
        end
        
        def update
          athlete = Athlete.find(params[:id])
          if athlete.update(athlete_params)
            render json: { status: 'SUCCESS', message: 'Atleta atualizado', data: athlete }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Atleta não atualizado', data: athlete.erros },
                   status: :unprocessable_entity
          end
        end
  
        def destroy
          athlete = Athlete.find(params[:id])
          athlete.destroy
          render json: { status: 'SUCCESS', message: 'Atleta deletado ', data: athlete }, status: :ok
        end
  
        private
  
        def athlete_params
          params.require(:athlete).permit(:id, :name, :gender, :country)
        end
      end
    end
  end