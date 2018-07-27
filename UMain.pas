unit UMain;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Spin, DrLabel,DBCtrls, TeeProcs, TeEngine, Chart, Series, cxGridChartView,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TFrmPrincipal = class(TForm)
    PnTop: TPanel;
    PnMain: TPanel;
    pgcPgMain: TPageControl;
    tsConexoes: TTabSheet;
    tsTransaction: TTabSheet;
    tsResumo: TTabSheet;
    BtnConectar: TBitBtn;
    QryConexoes: TZQuery;
    DsConexoes: TDataSource;
    QryTransaction: TZQuery;
    DsTransaction: TDataSource;
    Timer: TTimer;
    BtnSair: TBitBtn;
    QryConexoesATIVO: TStringField;
    QryConexoesCONEXAO: TLargeintField;
    QryConexoesPID: TIntegerField;
    QryConexoesSTATUS: TStringField;
    QryConexoesBANCO: TStringField;
    QryConexoesUSUARIO: TStringField;
    QryConexoesHOST: TStringField;
    QryConexoesREMOTE: TStringField;
    QryConexoesUSERPC: TStringField;
    Conexao: TZConnection;
    btnBtnPause: TBitBtn;
    EdRefresh: TSpinEdit;
    lbl1: TLabel;
    Panel4: TPanel;
    Panel1: TPanel;
    PnTransacoesBottom: TPanel;
    GridTransacoes: TcxGrid;
    TvTransacoes: TcxGridDBTableView;
    LvTrasacoes: TcxGridLevel;
    spl1: TSplitter;
    MnSql: TDBMemo;
    QryTransactionCONEXAO: TLargeintField;
    QryTransactionTEMPOCONEXAO: TStringField;
    QryTransactionTRANSACAO: TLargeintField;
    QryTransactionTEMPOTRANSACAO: TStringField;
    QryTransactionSTATUSTRANSACAO: TStringField;
    QryTransactionHOST: TStringField;
    QryTransactionMONREMOTE_PROCESS: TStringField;
    QryTransactionMONSQL_TEXT: TMemoField;
    QryTransactionMONSTAT_ID: TIntegerField;
    QryTransactionMONSTAT_GROUP: TSmallintField;
    QryTransactionMONRECORD_SEQ_READS: TLargeintField;
    QryTransactionMONRECORD_IDX_READS: TLargeintField;
    QryTransactionMONRECORD_INSERTS: TLargeintField;
    QryTransactionMONRECORD_UPDATES: TLargeintField;
    QryTransactionMONRECORD_DELETES: TLargeintField;
    QryTransactionMONRECORD_BACKOUTS: TLargeintField;
    QryTransactionMONRECORD_PURGES: TLargeintField;
    QryTransactionMONRECORD_EXPUNGES: TLargeintField;
    QryTransactionMONRECORD_LOCKS: TLargeintField;
    QryTransactionMONRECORD_WAITS: TLargeintField;
    QryTransactionMONRECORD_CONFLICTS: TLargeintField;
    QryTransactionMONBACKVERSION_READS: TLargeintField;
    QryTransactionMONFRAGMENT_READS: TLargeintField;
    QryTransactionMONRECORD_RPT_READS: TLargeintField;
    TvTransacoesCONEXAO: TcxGridDBColumn;
    TvTransacoesTEMPOCONEXAO: TcxGridDBColumn;
    TvTransacoesTRANSACAO: TcxGridDBColumn;
    TvTransacoesTEMPOTRANSACAO: TcxGridDBColumn;
    TvTransacoesSTATUSTRANSACAO: TcxGridDBColumn;
    TvTransacoesHOST: TcxGridDBColumn;
    TvTransacoesMONREMOTE_PROCESS: TcxGridDBColumn;
    TvTransacoesMONRECORD_SEQ_READS: TcxGridDBColumn;
    TvTransacoesMONRECORD_IDX_READS: TcxGridDBColumn;
    TvTransacoesMONRECORD_INSERTS: TcxGridDBColumn;
    TvTransacoesMONRECORD_UPDATES: TcxGridDBColumn;
    TvTransacoesMONRECORD_DELETES: TcxGridDBColumn;
    pnLeft: TPanel;
    BtnTransacoes: TBitBtn;
    Panel2: TPanel;
    BtnExcluirConexoes: TBitBtn;
    btnExcluirSQL: TBitBtn;
    QryExec: TZQuery;
    QryTransactionMONSTATEMENT_ID: TLargeintField;
    QryConexoesMONREMOTE_PROCESS: TStringField;
    Panel3: TPanel;
    lbBD: TDRLabel;
    Panel5: TPanel;
    lbVersao: TDRLabel;
    QryConexoesMONCLIENT_VERSION: TStringField;
    GridConexoes: TcxGrid;
    TvConexoes: TcxGridDBTableView;
    LvConexoes: TcxGridLevel;
    TvConexoesATIVO: TcxGridDBColumn;
    TvConexoesCONEXAO: TcxGridDBColumn;
    TvConexoesPID: TcxGridDBColumn;
    TvConexoesSTATUS: TcxGridDBColumn;
    TvConexoesUSUARIO: TcxGridDBColumn;
    TvConexoesHOST: TcxGridDBColumn;
    TvConexoesREMOTE: TcxGridDBColumn;
    TvConexoesUSERPC: TcxGridDBColumn;
    TvConexoesMONREMOTE_PROCESS: TcxGridDBColumn;
    chtrans: TChart;
    QryTop: TZQuery;
    DsTop: TDataSource;
    QryTopMAXTOP: TLargeintField;
    QryTopMINTOP: TLargeintField;
    Series1: TLineSeries;
    Series2: TLineSeries;
    tsUsuarios: TTabSheet;
    cht1: TChart;
    SerieUsuario: TLineSeries;
    QryTopUSUARIOS: TLargeintField;
    drloperacao: TDRLabel;
    procedure BtnConectarClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    function conectar : boolean;
    procedure btnBtnPauseClick(Sender: TObject);
    procedure BtnExcluirConexoesClick(Sender: TObject);
    procedure btnExcluirSQLClick(Sender: TObject);
    procedure BtnTransacoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Atualiza;
    procedure ControleBotoes(pBotao:integer);
    procedure AtualizaGrafico;  
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.Atualiza;
begin
   Conexao.Disconnect;
   Conexao.Reconnect;
   QryConexoes.Close;
   QryConexoes.Open;
   QryTransaction.Close;
   QryTransaction.Open;
   Self.AtualizaGrafico;
end;

procedure TFrmPrincipal.AtualizaGrafico;
begin
   QryTop.Close;
   QryTop.Open;


   Series1.AddY(StrToCurrDef(QryTopMAXTOP.AsString,0),FormatDateTime('hh:nn:ss', Now),clNavy);
   Series2.AddY(StrToCurrDef(QryTopMINTOP.AsString,0),FormatDateTime('hh:nn:ss', Now),clGreen);
   SerieUsuario.AddY(StrToCurrDef(QryTopUSUARIOS.AsString,0),FormatDateTime('hh:nn:ss', Now),clGreen);

//   Serie1.AddValue(QryTopMAXTOP.AsInteger);
//   Serie2.AddValue(QryTopMINTOP.AsInteger);
//   Serie3.AddValue(QryTopMAXTOP.AsInteger);

end;


procedure TFrmPrincipal.btnBtnPauseClick(Sender: TObject);
begin
  Timer.Enabled := False;
  DRLOperacao.Caption := 'Pausado';
  Self.ControleBotoes(1);
end;

procedure TFrmPrincipal.BtnConectarClick(Sender: TObject);
begin
  if  self.conectar  then
  begin
    QryConexoes.Close;
    QryConexoes.Open;
    if not QryConexoes.IsEmpty then
    begin
      while not QryConexoes.eof do
      begin
        if QryConexoesMONCLIENT_VERSION.AsString <> '' then
        begin
          lbBD.Caption := ExtractFileName (QryConexoesBANCO.AsString);
          lbVersao.Caption := QryConexoesMONCLIENT_VERSION.AsString;
          break;
        end;
        QryConexoes.next;
      end;

    end;

    Timer.Enabled := True;
    DRLOperacao.Caption := 'Conectado';
    Self.ControleBotoes(0);
  end
  else
  begin
    Timer.Enabled := False;
    DRLOperacao.Caption := 'Desconectado';
  end;
end;

procedure TFrmPrincipal.btnExcluirSQLClick(Sender: TObject);
begin
  try
    with QryExec, sql do
    begin
      clear;
      add(' DELETE from MON$STATEMENTS where MON$STATEMENT_ID = :varid');
      ParamByName('varid').AsInteger := QryTransaction.FieldByName('MON$STATEMENT_ID').Asinteger;
      execsql;
    end;
    Conexao.Commit;
    Self.Atualiza;
  except
    on E: Exception do
    begin
      ShowMessage('ERRO ao excluir :'+ E.Message);
      Conexao.Rollback;
    end;
  end;
end;

procedure TFrmPrincipal.BtnExcluirConexoesClick(Sender: TObject);
begin
  try
    with QryExec, sql do
    begin
      clear;
      add(' DELETE from MON$ATTACHMENTS where MON$ATTACHMENT_ID = :varid');
      ParamByName('varid').AsInteger := QryConexoes.FieldByName('conexao').Asinteger;
      execsql;
    end;
    Conexao.Commit;
    Self.Atualiza;
  except
    on E: Exception do
    begin
      ShowMessage('ERRO ao excluir :'+ E.Message);
      Conexao.Rollback;
    end;
  end;
end;

procedure TFrmPrincipal.BtnTransacoesClick(Sender: TObject);
begin
  try
    with QryExec, sql do
    begin
      clear;
      add(' DELETE from MON$TRANSACTIONS where MON$TRANSACTION_ID = '+QryTransaction.FieldByName('transacao').AsString);
//      ParamByName('varid').AsInteger := ;
      execsql;
    end;
    Conexao.Commit;
    Self.Atualiza;
  except
    on E: Exception do
    begin
      ShowMessage('ERRO ao excluir :'+ E.Message);
      Conexao.Rollback;
    end;
  end;
end;

function TFrmPrincipal.conectar: boolean;
const
  NomeArquivo: string = 'Conexao.cfg';
var
  Arquivo: TextFile;
  Path, LinhaArq: string;
begin
  result := False;
  try
    if FileExists(Path + NomeArquivo) then
    begin
      Conexao.Protocol := 'firebirdd-2.5';
      AssignFile(Arquivo, Path + NomeArquivo);
      Reset(Arquivo);

      ReadLn(Arquivo, LinhaArq);
      Conexao.HostName := LinhaArq;

      ReadLn(Arquivo, LinhaArq);
      Conexao.DataBase := LinhaArq;

      ReadLn(Arquivo, LinhaArq);
      Conexao.User := LinhaArq;

      ReadLn(Arquivo, LinhaArq);
      Conexao.Password  := LinhaArq;
      Conexao.Connected := True;
      Result := true;
    end
    else
      MessageDlg('Arquivo Conexao.cfg n�o existe !',  mtWarning, [mbOK], 0);

  except
    result := False;
    MessageDlg('Problemas com a comunica��o DB !',  mtError, [mbOK], 0);
  end;

end;

procedure TFrmPrincipal.ControleBotoes(pBotao: integer);
begin
  if pBotao = 0 then
    BtnConectar.enabled := False
  else
    BtnConectar.enabled := True;
  if pBotao = 1 then
    btnBtnPause.enabled := False
  else
    btnBtnPause.enabled := True;
  if pBotao = 2 then
    BtnSair.enabled := False
  else
    BtnSair.enabled := True;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
 Series1.Clear;
  Series2.Clear;
end;

procedure TFrmPrincipal.BtnSairClick(Sender: TObject);
begin
  Conexao.Connected := False;
  Timer.Enabled := False;
  DRLOperacao.Caption := 'Desconectado';
  Self.ControleBotoes(2);
  Series1.Clear;
  Series2.Clear;
  SerieUsuario.Clear;
end;

procedure TFrmPrincipal.TimerTimer(Sender: TObject);
begin
   Timer.Interval := StrtointDef(EdRefresh.text,0)*1000;
   Self.Atualiza;
end;

end.
