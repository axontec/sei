 it 'gera um procedimento e adiciona 1 documento gerado' do
    procedimento = Imasei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('20')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    
    retorno_geracao_procedimento = Imasei::Servico.gerar_procedimento(
                                      '110000949',
                                      procedimento,
                                      documentos = [],
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    documento =
      Imasei::Estruturas::Documento.new
        .tipo('G')
        .id_procedimento(retorno_geracao_procedimento.id_procedimento)
        .id_serie('20')
        .descricao('Descrição do documento 1')
        .remetente('Remetente do documento 1')
        .observacao('Observação do documento 1')
        .conteudo('Conteúdo do documento 1')

    retorno_inclusao_documento = Imasei::Servico.incluir_documento(
                                    '110000949',
                                    documento)

    refute_nil retorno_inclusao_documento.id_documento
  end