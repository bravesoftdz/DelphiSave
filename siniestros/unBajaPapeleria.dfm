inherited frmBajaPapeleria: TfrmBajaPapeleria
  Left = 192
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Baja de papeler'#237'a'
  ClientHeight = 133
  ClientWidth = 424
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnAceptar: TBitBtn [0]
    Left = 251
    Top = 99
    Width = 79
    Height = 28
    Caption = '&Aceptar'
    TabOrder = 0
    OnClick = btnAceptarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCerrar: TBitBtn [1]
    Left = 339
    Top = 99
    Width = 79
    Height = 28
    Cancel = True
    Caption = '&Cerrar'
    TabOrder = 1
    OnClick = btnCerrarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox [2]
    Left = 2
    Top = 2
    Width = 416
    Height = 90
    TabOrder = 2
    object Label27: TLabel
      Left = 4
      Top = 27
      Width = 11
      Height = 13
      Caption = 'ID'
    end
    object Label28: TLabel
      Left = 76
      Top = 27
      Width = 24
      Height = 13
      Caption = 'CUIL'
    end
    object Label29: TLabel
      Left = 188
      Top = 27
      Width = 25
      Height = 13
      Caption = 'Trab.'
    end
    object Label1: TLabel
      Left = 8
      Top = 60
      Width = 32
      Height = 13
      Caption = 'Motivo'
    end
    object edIDDoc: TIntEdit
      Left = 20
      Top = 23
      Width = 51
      Height = 21
      TabOrder = 0
      OnEnter = edIDDocEnter
      OnExit = edIDDocExit
      OnKeyPress = edIDDocKeyPress
    end
    object mskCUITDoc: TMaskEdit
      Left = 104
      Top = 23
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      EditMask = '99-99999999-c;0;'
      MaxLength = 13
      ReadOnly = True
      TabOrder = 2
    end
    object cmbTrabDoc: TArtComboBox
      Left = 217
      Top = 23
      Width = 192
      Height = 21
      TabStop = False
      Color = clBtnFace
      GlyphKind = gkDropDown
      NumGlyphs = 1
      ReadOnly = True
      TabOrder = 3
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_ID'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_CUIL'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_NOMBRE'
          Title.Caption = 'Trabajador'
          Width = 120
          Visible = True
        end>
      FieldList = 'ID_NOMBRE'
      FieldKey = 'ID_ID'
    end
    inline fraMotivo: TfraCodDesc
      Left = 48
      Top = 55
      Width = 361
      Height = 23
      TabOrder = 1
      inherited cmbDescripcion: TArtComboBox
        Width = 296
      end
      inherited Propiedades: TPropiedadesFrame
        TableName = 'SIN.smp_motivobajapapeleria'
        FieldID = 'mp_id'
        FieldCodigo = 'mp_codigo'
        FieldDesc = 'mp_descripcion'
        FieldBaja = 'mp_fechabaja'
      end
    end
  end
  object sdqPapeleria: TSDQuery
    DatabaseName = 'dbprincipal'
    SQL.Strings = (
      'SELECT id_id, id_cuil, id_nombre'
      '  FROM SIN.sid_informacion_dictamen'
      ' WHERE id_fechabaja IS NULL'
      '   AND id_fechacargadicta IS NULL'
      '   AND id_id = :IdPapel')
    Left = 12
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdPapel'
        ParamType = ptInput
      end>
  end
  object dsPapeleria: TDataSource
    DataSet = sdqPapeleria
    Left = 40
    Top = 4
  end
end
