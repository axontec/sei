module Imasei

  module Estruturas

    class RetornoConsultarProcedimento < ::Valuable

      has_value :id_procedimento
      has_value :procedimento_formatado
      has_value :especificacao
      has_value :data_autuacao
      has_value :link_acesso
      has_value :tipo_procedimento
      has_collection :retorno_unidades_procedimento_aberto, klass: RetornoUnidadesProcedimentoAberto
      has_collection :retorno_tipo_procedimento, klass: RetornoTipoProcedimento
      

      def initialize(params)
        #teste(params)
        self.id_procedimento = params[:id_procedimento]
        self.procedimento_formatado = params[:procedimento_formatado]
        self.especificacao = params[:especificacao]
        self.data_autuacao = params[:data_autuacao]
        self.link_acesso = params[:link_acesso]
        if params[:unidades_procedimento_aberto] && params[:unidades_procedimento_aberto][:item]
          item = params[:unidades_procedimento_aberto][:item]
          if item.is_a?(Hash)
            self.retorno_unidades_procedimento_aberto << Imasei::Estruturas::RetornoUnidadesProcedimentoAberto.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_unidades_procedimento_aberto|
              self.retorno_unidades_procedimento_aberto << Imasei::Estruturas::RetornoUnidadesProcedimentoAberto.new(retorno_unidades_procedimento_aberto)
            end
          end
        end
        
#Tipo Procedimento
        if params[:tipo_procedimento]
          item = params[:tipo_procedimento]
          if item.is_a?(Hash)
            self.retorno_unidades_procedimento_aberto << Imasei::Estruturas::RetornoTipoProcedimento.new(item)
          elsif item.is_a?(Array)
            item.each do |retorno_tipo_procedimento|
              self.retorno_unidades_procedimento_aberto << Imasei::Estruturas::RetornoTipoProcedimento.new(retorno_tipo_procedimento)
            end
          end
        end


        initialize_attributes
        
      end


    def teste(p)
      #debugger
    end


    end

  end

end