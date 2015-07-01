inherited frmMigracionBANK: TfrmMigracionBANK
  Left = 419
  Top = 268
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Migraci'#243'n BANK'
  ClientHeight = 271
  ClientWidth = 578
  OldCreateOrder = True
  DesignSize = (
    578
    271)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 7
    Top = 136
    Width = 65
    Height = 13
    AutoSize = False
    Caption = 'Tabla: '
  end
  object Label2: TLabel [1]
    Left = 245
    Top = 136
    Width = 54
    Height = 13
    AutoSize = False
    Caption = 'Tipo Arch.:'
  end
  object Label3: TLabel [2]
    Left = 7
    Top = 167
    Width = 65
    Height = 13
    AutoSize = False
    Caption = 'Cant. Reg.:'
  end
  object Label4: TLabel [3]
    Left = 7
    Top = 192
    Width = 65
    Height = 13
    AutoSize = False
    Caption = 'Procesados:'
  end
  object Label5: TLabel [4]
    Left = 7
    Top = 217
    Width = 65
    Height = 13
    AutoSize = False
    Caption = 'Migrados OK:'
  end
  object Label6: TLabel [5]
    Left = 177
    Top = 217
    Width = 125
    Height = 13
    AutoSize = False
    Caption = 'Migrados OK (Clave Inv.):'
  end
  object Label7: TLabel [6]
    Left = 419
    Top = 217
    Width = 66
    Height = 13
    AutoSize = False
    Caption = 'No Migrados:'
  end
  object Label8: TLabel [7]
    Left = 389
    Top = 182
    Width = 69
    Height = 13
    AutoSize = False
    Caption = 'Nro. Pasada:'
  end
  object btnMigrar: TButton [8]
    Left = 401
    Top = 244
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Migrar'
    TabOrder = 0
    OnClick = btnMigrarClick
  end
  object btnCancelar: TButton [9]
    Left = 491
    Top = 244
    Width = 85
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  inline fraFiltroArchivoMigrac: TfraFiltroArchivo [10]
    Left = 4
    Top = 6
    Width = 569
    Height = 102
    VertScrollBar.Visible = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    inherited pcFormulario: TJvPageControl
      Width = 569
      Visible = False
      inherited tsSiniestro: TTabSheet
        inherited lbRSocial: TLabel
          FocusControl = fraFiltroArchivoMigrac.fraEmpresaSiniestro.cmbRSocial
        end
      end
      inherited tsBiblioratoNota: TTabSheet
        inherited lbCUIT: TLabel
          FocusControl = fraFiltroArchivoMigrac.fraEmpresaNota.mskCUIT
        end
      end
      inherited tsExtractoBanc: TTabSheet
        inherited fraBancoExtracto: TfraStaticCodigoDescripcion
          inherited cmbDescripcion: TComboGrid
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja')
            ColWidths = (
              40
              300
              -1
              -1)
          end
        end
        inherited fraCuentaBancariaExtracto: TfraStaticCodigoDescripcion
          inherited cmbDescripcion: TComboGrid
            Cells = (
              'C'#243'digo'
              'Descripci'#243'n'
              'Id'
              'Fecha de Baja')
            ColWidths = (
              40
              300
              -1
              -1)
          end
        end
      end
    end
    inherited pnSeleccionArchivo: TPanel
      Width = 569
      DesignSize = (
        569
        24)
      inherited btnCargarCodigoBarras: TJvXPButton
        Left = 472
      end
      inherited fraTipoArchivo: TfraCodDesc
        Width = 416
        DesignSize = (
          416
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 351
        end
      end
    end
  end
  object JvProgressBarMigrac: TJvProgressBar [11]
    Left = 4
    Top = 250
    Width = 383
    Height = 16
    Anchors = [akLeft, akBottom]
    Step = 100
    TabOrder = 3
  end
  object edTabla: TEdit [12]
    Left = 74
    Top = 133
    Width = 164
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    TabOrder = 4
  end
  object edTipoArchivo: TEdit [13]
    Left = 302
    Top = 133
    Width = 44
    Height = 21
    TabStop = False
    CharCase = ecUpperCase
    Color = clBtnFace
    Enabled = False
    TabOrder = 5
  end
  object edCantReg: TIntEdit [14]
    Left = 74
    Top = 163
    Width = 86
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    TabOrder = 6
    Text = '0'
  end
  object edProcesados: TIntEdit [15]
    Left = 74
    Top = 188
    Width = 86
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    TabOrder = 7
    Text = '0'
  end
  object edOK: TIntEdit [16]
    Left = 74
    Top = 213
    Width = 86
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    TabOrder = 8
    Text = '0'
  end
  object edOKClaveInv: TIntEdit [17]
    Left = 302
    Top = 213
    Width = 86
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    TabOrder = 9
    Text = '0'
  end
  object edNoMigrados: TIntEdit [18]
    Left = 488
    Top = 213
    Width = 86
    Height = 21
    TabStop = False
    Color = clBtnFace
    Enabled = False
    TabOrder = 10
    Text = '0'
  end
  object rgMigrar: TRadioGroup [19]
    Left = 385
    Top = 111
    Width = 190
    Height = 63
    Caption = 'Migrar '
    ItemIndex = 0
    Items.Strings = (
      'Solo el archivo seleccionado'
      'A partir del archivo seleccionado'
      'A partir de pasada nro.')
    TabOrder = 11
    OnClick = rgMigrarClick
  end
  object edNroPasada: TIntEdit [20]
    Left = 463
    Top = 179
    Width = 111
    Height = 21
    TabStop = False
    Color = clWhite
    TabOrder = 12
    Text = '0'
  end
  inherited FormStorage: TFormStorage [21]
    Left = 8
    Top = 290
  end
  inherited XPMenu: TXPMenu [22]
    Left = 36
    Top = 290
  end
  inherited ilByN: TImageList [23]
    Left = 8
    Top = 318
  end
  inherited ilColor: TImageList [24]
    Left = 36
    Top = 318
  end
  inherited IconosXP: TImageList
    Left = 64
    Top = 318
  end
  object sdqTablasBank: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT ROWID RWID, '
      
        #39'SELECT '#39' || TRIM(IDTIPOARCHIVO) || '#39' tipoarchivo, fd_carpeta ca' +
        'rpeta, fd_imagen imagen, '#39' || CHR(13) || CHR(10) ||'
      
        '        (CASE WHEN IDTIPOARCHIVO IN (8, 10, 15, 25) THEN '#39'TO_CHA' +
        'R(NULL)'#39
      '              WHEN IDTIPOARCHIVO = 18 THEN '#39'TRIM(codigo)'#39
      '              WHEN IDTIPOARCHIVO = 30 THEN '#39#39#39'EXTRB'#39#39#39
      '              WHEN IDTIPOARCHIVO = 31 THEN '#39#39#39'BLCE'#39#39#39
      
        '         ELSE '#39'TRIM(fd_doc)'#39' END) || '#39' coddocumento, '#39' || CHR(13' +
        ') || CHR(10) ||'
      
        '       '#39'fd_lote lote, fd_cdrom cd, fd_caja caja, '#39' || CLAVE || '#39 +
        ' clave, '#39' || CHR(13) || CHR(10) ||'
      
        '        (CASE WHEN UPPER(TRIM(TABLABANK)) IN ('#39'BANK.SCANCART'#39', '#39 +
        'BANK.SCANCCCO'#39') THEN '#39'SUBSTR(TRIM(TO_CHAR(carta)), 1, 12)'#39
      
        '         ELSE '#39#39#39#39#39#39' END) || '#39' nrocartadoc, '#39' || CHR(13) || CHR(' +
        '10) ||'
      
        '        (CASE WHEN UPPER(TRIM(TABLABANK)) IN ('#39'BANK.SCANEXTR'#39') T' +
        'HEN '#39'hoja'#39
      
        '         ELSE '#39'TO_NUMBER(NULL)'#39' END) || '#39' nrohoja, '#39' || CHR(13) ' +
        '|| CHR(10) ||'
      
        '        (CASE WHEN UPPER(TRIM(TABLABANK)) IN ('#39'BANK.SCANVIAP'#39') T' +
        'HEN '#39'nrolegajo'#39
      
        '         ELSE '#39'TO_NUMBER(NULL)'#39' END) || '#39' legajo, '#39' || CHR(13) |' +
        '| CHR(10) ||'
      
        '        (CASE WHEN UPPER(TRIM(TABLABANK)) IN ('#39'BANK.SCANGIRO'#39') T' +
        'HEN '#39'TRIM(TO_CHAR(nrooper))'#39
      
        '         ELSE '#39#39#39#39#39#39' END) || '#39' nroopergt, '#39' || CHR(13) || CHR(10' +
        ') ||'
      
        '        (CASE WHEN UPPER(TRIM(TABLABANK)) IN ('#39'BANK.SCANGIRO'#39') T' +
        'HEN '#39'TRIM(beneficiar)'#39
      
        '         ELSE '#39#39#39#39#39#39' END) || '#39' beneficiargt, '#39' || CHR(13) || CHR' +
        '(10) ||'
      
        '        (CASE WHEN UPPER(TRIM(TABLABANK)) IN ('#39'BANK.SCANGIRO'#39') T' +
        'HEN '#39'fecha'#39
      
        '         ELSE '#39'TO_DATE(NULL)'#39' END) || '#39' fechagt, '#39' || CHR(13) ||' +
        ' CHR(10) ||'
      
        '        (CASE WHEN UPPER(TRIM(TABLABANK)) IN ('#39'BANK.SCANGIRO'#39') T' +
        'HEN '#39'DECODE(cheque, 0, '#39#39#39#39', TRIM(TO_CHAR(cheque)))'#39
      
        '         ELSE '#39#39#39#39#39#39' END) || '#39' chequegt, '#39' || CHR(13) || CHR(10)' +
        ' ||'
      
        '       '#39'NVL('#39' ||(CASE WHEN IDTIPOARCHIVO IN (6, 15, 18, 22, 26, ' +
        '27, 29, 32, 33, 37)'
      
        '                           OR (IDTIPOARCHIVO = 3 AND UPPER(TABLA' +
        'BANK) = '#39'BANK.SCANCCCO'#39')  THEN '#39'TO_DATE(NULL)'#39
      
        '                      WHEN IDTIPOARCHIVO IN (21, 30) THEN '#39'fecha' +
        #39
      
        '                 ELSE '#39'fd_fecha'#39' END) || '#39', ART.ACTUALDATE) fech' +
        'aalta, '#39' || CHR(13) || CHR(10) ||'
      
        '       decode(observaciones, null, '#39'NULL'#39', observaciones) || '#39' o' +
        'bservac, '#39' || CHR(13) || CHR(10) ||'
      
        '       '#39#39#39#39' || TABLABANK || '#39#39#39' tablabank, '#39' || TABLABANK || '#39'.R' +
        'OWID RID, '#39' || CHR(13) || CHR(10) ||'
      
        '       decode(LOTEENVIODOC, null, '#39'NULL'#39', LOTEENVIODOC) || '#39' lot' +
        'eenviodoc '#39' || CHR(13) || CHR(10) ||'
      #39'FROM '#39' || TABLABANK || CHR(13) || CHR(10) ||'
      
        'DECODE(SUBSTR(WHEREADIC, 1, 1), '#39','#39', WHEREADIC || CHR(13) || CHR' +
        '(10), '#39#39') || '#39' '#39' ||'
      
        '(CASE WHEN WHEREADIC IS NULL THEN '#39'WHERE 1 = 1 '#39' || CHR(13) || C' +
        'HR(10)'
      
        '      WHEN SUBSTR(WHEREADIC, 1, 1) <> '#39','#39' THEN '#39'WHERE '#39' || WHERE' +
        'ADIC || CHR(13) || CHR(10)'
      ' ELSE '#39#39' END) ||'
      
        #39'AND SUBSTR(fd_carpeta, 1, 1) <> '#39#39'3'#39#39' '#39' || CHR(13) || CHR(10) S' +
        'TRSQL, TABLABANK'
      ' FROM NEL.MIGRACIONBANKAGA'
      'WHERE IDTIPOARCHIVOMIGRADO = '#39'N'#39' '
      ''
      '')
    Left = 320
    Top = 164
  end
  object tmInicio: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmInicioTimer
    Left = 284
    Top = 164
  end
end
