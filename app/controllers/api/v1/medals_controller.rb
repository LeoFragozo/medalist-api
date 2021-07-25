module Api
    module V1
      class MedalsController < ApplicationController
        def index
          medals = Medal.order('created_at ASC')
          render json: { status: 'SUCCESS', message: 'Medalhas carregadas', data: medals },
                 status: :ok
        end
  
        def show
          medal = Medal.find(params[:id])
          render json: { status: 'SUCCESS', message: 'Medalhas carregadas', data: medal },
                 status: :ok
        end
  
        def create
          medal = Medal.new(medal_params)
           if medal.save
              render json: {status: 'SUCCESS', message:'Medalha salva', data:medal},status: :ok
           else
             render json: {status: 'ERROR', message:'Medalha não salva', data:medal.erros},status: :unprocessable_entity
          end
        end
        
        def update
          medal = Medal.find(params[:id])
          if medal.update(medal_params)
            render json: { status: 'SUCCESS', message: 'Medalha atualizada', data: medal }, status: :ok
          else
            render json: { status: 'ERROR', message: 'Medalha não atualizada', data: medal.erros },
                   status: :unprocessable_entity
          end
        end
  
        def destroy
          medal = Medal.find(params[:id])
          medal.destroy
          render json: { status: 'SUCCESS', message: 'Medalha deletada ', data: medal }, status: :ok
        end
  
        private
  
        def medal_params
          params.require(:medal).permit(:id, :kind, :competition)
        end
      end
    end
  end