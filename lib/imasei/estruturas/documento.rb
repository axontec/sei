module Imasei

  module Estruturas

    class Documento

      def tipo(tipo)
        @tipo = tipo
        self
      end

      def id_procedimento(id_procedimento)
        @id_procedimento = id_procedimento
        self
      end

      def id_serie(id_serie)
        @id_serie = id_serie
        self
      end

      def numero(numero)
        @numero = numero
        self
      end

      def data(data)
        #@data = data.strftime('%d/%m/%Y') rescue nil
        @data = data.to_datetime.strftime('%d/%m/%Y') rescue nil
        self
      end

      def descricao(descricao)
        @descricao = descricao
        self
      end

      def remetente(remetente)
        @remetente = remetente
        self
      end

      def interessado(sigla, nome)
        @interessados ||= []
        @interessados << {
          interessado: {
            sigla: sigla,
            nome: nome
          }
        }
        self
      end

      def destinatario(sigla, nome)
        @destinatarios ||= []
        @destinatarios << {
          destinatario: {
            sigla: sigla,
            nome: nome
          }
        }
        self
      end

      def observacao(observacao)
        @observacao = observacao
        self
      end

      def nome_arquivo(nome_arquivo)
        @nome_arquivo = nome_arquivo
        self
      end

      def conteudo(conteudo)
        if conteudo.nil?
          conteudo = ''
        end
        if @tipo == 'R' && @conteudo_raw.present?
          @conteudo = @conteudo_raw
        else
          @conteudo = Base64.strict_encode64(conteudo)
        end
        self
      end

      def conteudo_mtom(conteudo_mtom)
        if conteudo_mtom.nil?
          conteudo_mtom = './4.png'
        end
        @conteudo_mtom = Base64.strict_encode64(File.read(conteudo_mtom))
        self
      end

      def conteudo_raw(conteudo_raw)
        @conteudo_raw = conteudo_raw
        self
      end
      
      def nivel_de_acesso(nivel_de_acesso)
        @nivel_de_acesso = nivel_de_acesso
        self
      end

      def to_h
        {
          tipo: @tipo,
          id_procedimento: @id_procedimento,
          id_serie: @id_serie,
          numero: @numero,
          data: @data,
          descricao: @descricao,
          remetente: @remetente,
          interessados: @interessados.nil? ? {} : @interessados,
          destinatarios: @destinatarios.nil? ? {} : @destinatarios,
          observacao: @observacao,
          nome_arquivo: @nome_arquivo,
          conteudo: @conteudo,
          conteudo_mtom: @conteudo_mtom,
          nivel_de_acesso: @nivel_de_acesso
        }
      end

    end

  end

end