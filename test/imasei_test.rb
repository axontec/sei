require 'test_helper'

describe 'wssei' do

  before do
    Wssei.configure do |config|
      config.wsdl = "https://sei-treinamento.campinas.sp.gov.br/sei/controlador_ws.php?servico=sei"
      config.follow_redirects = true
      config.pretty_print_xml = true
      config.sigla = 'DAC'
      config.identificacao = 'SISDAC'
    end
  end

  it 'gera um procedimento com 2 documentos recebidos' do
    procedimento = Wssei::Estruturas::Procedimento.new
                    .id_tipo_procedimento('26')
                    .especificacao('Especificação do processo')
                    .assunto('01.01.01', 'Licitação')
                    .interessado('leandro.telles', 'Leandro Telles')
                    .observacao('Observação do webservice')
                    .nivel_de_acesso('0')
    documentos = [
      Wssei::Estruturas::Documento.new
        .tipo('R')
        .id_serie('20')
        .numero('Nome na árvore')
        .data(Date.today)
        .remetente('Remetente do documento')
        .nome_arquivo('ws-manual.pdf')
        .conteudo(File.read('./test/ws-manual.pdf')),
      Wssei::Estruturas::Documento.new
        .tipo('R')
        .id_serie('20')
        .numero('Nome na árvore')
        .data(Date.today)
        .remetente('Remetente do documento')
        .nome_arquivo('logo-sei.png')
        .conteudo(File.read('./test/logo-sei.png'))
    ]

    retorno_geracao_procedimento = Wssei::Servico.gerar_procedimento(
                                      '110001176',
                                      procedimento,
                                      documentos,
                                      procedimentos_relacionados = [],
                                      unidades_envio = [],
                                      manter_aberto_unidade = 'N',
                                      enviar_email_notificacao = 'N',
                                      data_retorno_programado = nil,
                                      dias_retorno_programado = nil,
                                      dias_uteis_retorno_programado = 'N')

    refute_nil retorno_geracao_procedimento.id_procedimento
  end


end
