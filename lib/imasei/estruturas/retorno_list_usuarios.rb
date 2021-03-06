module Imasei

  module Estruturas

    class RetornoListUsuarios < ::Valuable

      has_collection :retorno_list_usuarios, klass: RetornoUsuario

      def initialize(params)        
        self.retorno_list_usuarios = []          
          item = params[:item]
          if item.is_a?(Hash)
            self.retorno_list_usuarios << Imasei::Estruturas::RetornoUsuario.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_lista_usuarios|
              self.retorno_list_usuarios << Imasei::Estruturas::RetornoUsuario.new(retorno_lista_usuarios)
            end
          end        
        initialize_attributes
      end

    end

  end

end