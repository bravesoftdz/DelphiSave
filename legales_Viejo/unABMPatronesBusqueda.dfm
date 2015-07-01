inherited frmAbmPatronesBusqueda: TfrmAbmPatronesBusqueda
  Left = 295
  Top = 170
  Width = 477
  Height = 362
  Caption = 'Patrones de B'#250'squeda'
  FormStyle = fsNormal
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 469
    Height = 5
  end
  inherited CoolBar: TCoolBar
    Top = 5
    Width = 469
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 465
      end>
    inherited ToolBar: TToolBar
      Width = 452
      inherited tbMostrarOcultarColumnas: TToolButton
        ImageIndex = 9
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 34
    Width = 469
    Height = 301
    Columns = <
      item
        Expanded = False
        FieldName = 'PA_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CA_DESCRIPCION'
        Title.Caption = 'Campo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PA_VALORBUSQUEDA'
        Title.Caption = 'Valor'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 44
    Top = 77
    Width = 398
    Height = 132
    Constraints.MaxHeight = 189
    Constraints.MinHeight = 108
    Constraints.MinWidth = 398
    inherited BevelAbm: TBevel
      Top = 96
      Width = 390
    end
    object Label1: TLabel [1]
      Left = 12
      Top = 16
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel [2]
      Left = 12
      Top = 66
      Width = 71
      Height = 13
      Caption = 'Valor a buscar:'
    end
    object lblCampo: TLabel [3]
      Left = 12
      Top = 42
      Width = 36
      Height = 13
      Caption = 'Campo:'
    end
    inherited btnAceptar: TButton
      Left = 240
      Top = 102
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Left = 318
      Top = 102
      TabOrder = 4
    end
    object edValor: TEdit
      Left = 96
      Top = 64
      Width = 293
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object edID: TIntEdit
      Left = 96
      Top = 12
      Width = 49
      Height = 21
      TabStop = False
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    inline fraCampos: TfraCodigoDescripcion
      Left = 95
      Top = 36
      Width = 298
      Height = 25
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 230
      end
      inherited sdqDatos: TSDQuery
        Top = 33
      end
      inherited dsDatos: TDataSource
        Top = 36
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      
        'FROM legales.LCA_CAMPOSBUSQUEDA LCA, legales.lpa_patronesanteced' +
        'ente LPA'
      'WHERE LCA.ca_id = LPA.pa_idcampobusqueda'
      'AND 1=2')
  end
  inherited SortDialog: TSortDialog
    SortFields = <
      item
        Title = 'C'#243'digo'
        DataField = 'PA_ID'
        FieldIndex = 0
      end
      item
        Title = 'Campo'
        DataField = 'CA_DESCRIPCION'
        FieldIndex = 1
      end
      item
        Title = 'Valor'
        DataField = 'PA_VALORBUSQUEDA'
        FieldIndex = 2
      end>
  end
  inherited QueryPrint: TQueryPrint
    PageOrientation = pxLandscape
    PageSize = psLetter
  end
end
