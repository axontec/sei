module Imasei

  module Estruturas

    class RetornoUnidadesProcedimentoAberto < ::Valuable

    has_collection :retorno_list_unidades, klass: RetornoUnidade
    has_collection :retorno_list_usuarios, klass: RetornoUsuario
    
      def initialize(params)
        teste(params)
        self.retorno_list_unidades = []          
          item = params[:unidade]
          if item.is_a?(Hash)
            self.retorno_list_unidades << Imasei::Estruturas::RetornoUnidade.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_lista_unidades|                      
              self.retorno_list_unidades << Imasei::Estruturas::RetornoUnidade.new(retorno_lista_unidades)
            end
          
          end  
          
          self.retorno_list_usuarios = []          
          item = params[:usuario_atribuicao]
          if item.is_a?(Hash)
            self.retorno_list_usuarios << Imasei::Estruturas::RetornoUsuario.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_lista_usuarios|                      
              self.retorno_list_usuarios << Imasei::Estruturas::RetornoUsuario.new(retorno_lista_usuarios)
            end
          
          end  
        initialize_attributes
      end
      def teste(usuario)
        #debugger
      end  
  end

  end

end