module Imasei

  module Servico

    def self.gerar_procedimento(id_unidade, procedimento, documentos = [], procedimentos_relacionados = [], unidades_envio = [], manter_aberto_unidade = 'S',
                  enviar_email_notificacao = 'N', data_retorno_programado = nil, dias_retorno_programado = nil, dias_uteis_retorno_programado = 'N')
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        Procedimento: procedimento.to_h,
        Documentos: documentos.empty? ? {} : {documento: documentos.map{|documento| documento.to_h}},
        ProcedimentosRelacionados: procedimentos_relacionados.empty? ? {} : {procedimento_relacionado: procedimentos_relacionados},
        UnidadesEnvio: unidades_envio.empty? ? {} : {unidade_envio: unidades_envio},
        SinManterAbertoUnidade: manter_aberto_unidade,
        SinEnviarEmailNotificacao: enviar_email_notificacao,
        DataRetornoProgramado: data_retorno_programado,
        DiasRetornoProgramado: dias_retorno_programado,
        SinDiasUteisRetornoProgramado: dias_uteis_retorno_programado
      }
      response = Imasei::Connection.instance.call :gerar_procedimento, message: message
      body = response.body[:gerar_procedimento_response][:parametros]
      Imasei::Estruturas::RetornoGeracaoProcedimento.new body
    end

    def self.incluir_documento(id_unidade, documento)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        Documento: documento.to_h
      }
      response = Imasei::Connection.instance.call :incluir_documento, message: message
      body = response.body[:incluir_documento_response][:parametros]
      Imasei::Estruturas::RetornoInclusaoDocumento.new body
    end


    def self.incluir_documento_bloco(id_unidade,id_bloco,protocolo_documento)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloDocumento: protocolo_documento
      }
      
      response = Imasei::Connection.instance.call :incluir_documento_bloco, message: message
      body = response.body[:incluir_documento_bloco_response][:parametros]
      Imasei::Estruturas::RetornoInclusaoDocumentoBloco.new body
    end

    def self.incluir_processo_bloco(id_unidade,id_bloco,protocolo_procedimento)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Imasei::Connection.instance.call :incluir_processo_bloco, message: message
      body = response.body[:incluir_processo_bloco_response][:parametros]
      Imasei::Estruturas::RetornoInclusaoProcessoBloco.new body
    end

    def self.concluir_processo(id_unidade,protocolo_procedimento)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Imasei::Connection.instance.call :concluir_processo, message: message
      body = response.body[:concluir_processo_response][:parametros]
      Imasei::Estruturas::RetornoConclusaoProcesso.new body

    end

    def self.reabrir_processo(id_unidade,protocolo_procedimento)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Imasei::Connection.instance.call :reabrir_processo, message: message
      body = response.body[:reabrir_processo_response][:parametros]
      Imasei::Estruturas::RetornoBoolean.new body

    end

    def self.retirar_processo_bloco(id_unidade,id_bloco,protocolo_procedimento)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloProcedimento: protocolo_procedimento
      }
      
      response = Imasei::Connection.instance.call :retirar_processo_bloco, message: message
      body = response.body[:retirar_processo_bloco_response][:parametros]
      Imasei::Estruturas::RetornoBoolean.new body
    end

    def self.atribuir_processo(id_unidade,protocolo_procedimento,id_usuario,sin_reabrir = 'N')

      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento,
        IdUsuario: id_usuario,
        SinReabrir: sin_reabrir

      }
      
      response = Imasei::Connection.instance.call :atribuir_processo, message: message
      body = response.body[:atribuir_processo_response][:parametros]
      Imasei::Estruturas::RetornoBoolean.new body
    end

    def self.retirar_documento_bloco(id_unidade,id_bloco,protocolo_documento)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco,
        ProtocoloDocumento: protocolo_documento
      }
      
      response = Imasei::Connection.instance.call :retirar_documento_bloco, message: message
      body = response.body[:retirar_documento_bloco_response][:parametros]
      Imasei::Estruturas::RetornoBoolean.new body
    end  

    def self.disponibilizar_bloco(id_unidade,id_bloco)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco
      }
      
      response = Imasei::Connection.instance.call :disponibilizar_bloco, message: message
      body = response.body[:disponibilizar_bloco_response][:parametros]
      Imasei::Estruturas::RetornoBoolean.new body
    end  

    def self.excluir_bloco(id_unidade,id_bloco)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdBloco: id_bloco
      }
      
      response = Imasei::Connection.instance.call :excluir_bloco, message: message
      body = response.body[:excluir_bloco_response][:parametros]
      Imasei::Estruturas::RetornoBoolean.new body
    end  

    def self.cancelar_documento(id_unidade,protocolo_documento,motivo)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloDocumento: protocolo_documento,
        Motivo: motivo
      }
      
      response = Imasei::Connection.instance.call :cancelar_documento, message: message
      body = response.body[:cancelar_documento_response][:parametros]
      Imasei::Estruturas::RetornoBoolean.new body
    end  


    def self.listar_usuarios(id_unidade,id_usuario = nil)     
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,

        IdUnidade: id_unidade,
        IdUsuario: id_usuario
      }
      response = Imasei::Connection.instance.call :listar_usuarios, message: message
      body = response.body[:listar_usuarios_response][:parametros]
      Imasei::Estruturas::RetornoListUsuarios.new body
    end

    def self.consultar_procedimento(id_unidade,protocolo_procedimento,sin_retornar_assuntos,sin_retornar_interessados,sin_retornar_observacoes,sin_retornar_andamento_geracao,sin_retornar_andamento_conclusao,sin_retornar_ultimo_andamento,sin_retornar_unidades_procedimento_aberto,sin_retornar_procedimentos_relacionados,sin_retornar_procedimentos_anexados)     
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        ProtocoloProcedimento: protocolo_procedimento,
        SinRetornarAssuntos: sin_retornar_assuntos,
        SinRetornarInteressados: sin_retornar_interessados,
        SinRetornarObservacoes: sin_retornar_observacoes,
        SinRetornarAndamentoGeracao: sin_retornar_andamento_geracao,
        SinRetornarAndamentoConclusao: sin_retornar_andamento_conclusao,
        SinRetornarUltimoAndamento: sin_retornar_ultimo_andamento,
        SinRetornarUnidadesProcedimentoAberto: sin_retornar_unidades_procedimento_aberto,
        SinRetornarProcedimentosRelacionados: sin_retornar_procedimentos_relacionados,
        SinRetornarProcedimentosAnexados: sin_retornar_procedimentos_anexados
        
      }
      response = Imasei::Connection.instance.call :consultar_procedimento, message: message
      body = response.body[:consultar_procedimento_response][:parametros]
      
      Imasei::Estruturas::RetornoConsultarProcedimento.new body
    end

    def self.listar_unidades(id_tipo_procedimento = nil,id_serie = nil)     
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdTipoProcedimento: id_tipo_procedimento,
        IdSerie: id_serie
      }
      response = Imasei::Connection.instance.call :listar_unidades, message: message
      body = response.body[:listar_unidades_response][:parametros]
      Imasei::Estruturas::RetornoListUnidades.new body
    end

    def self.gerar_bloco(id_unidade, tipo, descricao,unidades_disponibilizacao = [], documentos = [], sin_disponibilizar = 'N')
      message = {      
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        Tipo: tipo,
        Descricao: descricao,
        UnidadesDisponibilizacao: unidades_disponibilizacao,
        SinDisponibilizar: sin_disponibilizar
      }
      response = Imasei::Connection.instance.call :gerar_bloco, message: message
      
      body = response.body[:gerar_bloco_response][:parametros]
      Imasei::Estruturas::RetornoGeracaoBloco.new body
    end

    def self.listar_tipos_procedimento(id_unidade = nil,id_serie = nil)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdSerie: id_serie
      }
      response = Imasei::Connection.instance.call :listar_tipos_procedimento, message: message
      body = response.body[:listar_tipos_procedimento_response][:parametros]
      Imasei::Estruturas::RetornoListarTiposProcedimento.new body
    end

    def self.listar_series(id_unidade = nil,id_tipo_procedimento = nil)
      message = {
        SiglaSistema: Imasei.configuration.sigla,
        IdentificacaoServico: Imasei.configuration.identificacao,
        IdUnidade: id_unidade,
        IdTipoProcedimento: id_tipo_procedimento
      }
      response = Imasei::Connection.instance.call :listar_series, message: message
      body = response.body[:listar_series_response][:parametros]
      Imasei::Estruturas::RetornoListarSeries.new body
    end

  end

end