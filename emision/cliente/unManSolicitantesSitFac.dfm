inherited frmSolicitantesSitFac: TfrmSolicitantesSitFac
  Left = 584
  Top = 191
  Caption = 'Solicitantes Situaci'#243'n de Facturaci'#243'n'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Height = 0
  end
  inherited CoolBar: TCoolBar
    Top = 0
  end
  inherited Grid: TArtDBGrid
    Top = 29
    Height = 410
    Columns = <
      item
        Expanded = False
        FieldName = 'SS_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_DESCRIPCION'
        Title.Caption = 'Solicitante'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_CERRARNOTA'
        Title.Caption = 'Cerrar Nota'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_USUALTA'
        Title.Caption = 'Usu. Alta'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_FECHAMODIF'
        Title.Caption = 'Fecha Modif.'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_USUMODIF'
        Title.Caption = 'Usu. Modif'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SS_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Width = 120
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 136
    Top = 128
    Width = 345
    Height = 97
    Caption = 'Solicitantes Situaci'#243'n de Facturaci'#243'n'
    inherited BevelAbm: TBevel
      Top = 61
      Width = 337
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 17
      Width = 49
      Height = 13
      Caption = 'Solicitante'
    end
    inherited btnAceptar: TButton
      Left = 187
      Top = 67
    end
    inherited btnCancelar: TButton
      Left = 265
      Top = 67
    end
    object edSolicitante: TEdit
      Left = 68
      Top = 14
      Width = 271
      Height = 21
      TabOrder = 2
    end
    object chkCerrarNota: TCheckBox
      Left = 8
      Top = 39
      Width = 73
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Cerrar Nota'
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT *'
      'FROM emi.iss_solicitantesitfac')
  end
end
