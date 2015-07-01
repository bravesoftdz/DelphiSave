inherited frmEvaluacionMedica: TfrmEvaluacionMedica
  Left = 231
  Top = 108
  Width = 436
  Height = 553
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Evaluaci'#243'n m'#233'dica'
  Constraints.MaxHeight = 553
  Constraints.MinHeight = 553
  Constraints.MinWidth = 436
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnCancelar: TButton [0]
    Left = 324
    Top = 460
    Visible = False
  end
  inherited btnAceptar: TButton [1]
    Left = 246
    Top = 460
    Visible = False
  end
  inherited btnAplicar: TButton [2]
    Left = 167
    Top = 460
    Visible = False
  end
  inherited pnlBusqueda: TPanel [3]
    Width = 428
    Height = 5
  end
  inherited CoolBar: TCoolBar [4]
    Top = 5
    Width = 428
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 424
      end>
    inherited ToolBar: TToolBar
      Width = 411
      inherited tbNuevo: TToolButton
        ImageIndex = 6
        Visible = False
      end
      inherited tbModificar: TToolButton
        ImageIndex = 7
        Visible = False
      end
      inherited tbEliminar: TToolButton
        ImageIndex = 8
        Visible = False
      end
      inherited ToolButton4: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        ImageIndex = 4
        OnClick = tbImprimirClick
      end
      inherited tbSalir: TToolButton
        Hint = 'Guardar (Ctrl+G)'
        ImageIndex = 3
      end
      object tbSalir2: TToolButton
        Left = 174
        Top = 0
        Hint = 'Salir (Ctrl+S)'
        Caption = 'tbSalir2'
        ImageIndex = 5
        OnClick = tbSalir2Click
      end
    end
  end
  inherited pnlDatos: TPanel [5]
    Top = 34
    Width = 429
    Height = 492
    object gbDatosSiniestro: TGroupBox
      Left = 0
      Top = 0
      Width = 110
      Height = 41
      Caption = ' Siniestro'
      TabOrder = 1
      object edSiniestro: TSinEdit
        Left = 5
        Top = 14
        Width = 100
        Height = 21
        TabOrder = 0
        ReadOnly = True
        Color = clBtnFace
      end
    end
    object grpTrabajador: TGroupBox
      Left = 112
      Top = 0
      Width = 316
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Trabajador '
      TabOrder = 2
      TabStop = True
      DesignSize = (
        316
        41)
      inline fraTrabajadorSIN: TfraTrabajadorSIN
        Left = 2
        Top = 15
        Width = 311
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          311
          24)
        inherited lbTrabNombre: TLabel
          Left = 118
        end
        inherited mskTrabCUIL: TMaskEdit
          Left = 32
          Color = clBtnFace
          ReadOnly = True
        end
        inherited dbcTrabNombre: TArtComboBox
          Left = 160
          Width = 148
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object grpEmpresa: TGroupBox
      Left = 1
      Top = 42
      Width = 427
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Empresa '
      TabOrder = 3
      TabStop = True
      DesignSize = (
        427
        41)
      inline fraEmpresa: TfraEmpresa
        Left = 8
        Top = 15
        Width = 417
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DesignSize = (
          417
          23)
        inherited lbRSocial: TLabel
          Left = 88
        end
        inherited lbContrato: TLabel
          Left = 309
        end
        inherited mskCUIT: TMaskEdit
          Left = -1
          Color = clBtnFace
          ReadOnly = True
        end
        inherited edContrato: TIntEdit
          Left = 358
          Color = clBtnFace
          ReadOnly = True
        end
        inherited cmbRSocial: TArtComboBox
          Left = 132
          Width = 171
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object pnlEvaluacion: TPanel
      Left = 0
      Top = 88
      Width = 427
      Height = 404
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        427
        404)
      object Label9: TLabel
        Left = 5
        Top = 260
        Width = 56
        Height = 13
        Caption = 'Diagn'#243'stico'
      end
      object Label13: TLabel
        Left = 29
        Top = 284
        Width = 32
        Height = 13
        Caption = 'CIE 10'
      end
      object Label2: TLabel
        Left = 5
        Top = 9
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Enfermedad actual'
      end
      object Label3: TLabel
        Left = 5
        Top = 67
        Width = 135
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha primera manifestaci'#243'n'
      end
      object Label4: TLabel
        Left = 249
        Top = 67
        Width = 65
        Height = 13
        Caption = 'Fecha de alta'
      end
      object Label5: TLabel
        Left = 5
        Top = 87
        Width = 299
        Height = 13
        Alignment = taRightJustify
        Caption = 'Antecedentes personales / Enfermedad actual / Preexistencias'
      end
      object Label6: TLabel
        Left = 7
        Top = 141
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Puesto de trabajo'
      end
      object Label7: TLabel
        Left = 5
        Top = 160
        Width = 158
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descripci'#243'n del puesto de trabajo'
      end
      object Label8: TLabel
        Left = 5
        Top = 207
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Examen f'#237'sico'
      end
      object Label10: TLabel
        Left = 323
        Top = 260
        Width = 44
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Inc. pres.'
      end
      object Label11: TLabel
        Left = 5
        Top = 304
        Width = 193
        Height = 13
        Alignment = taRightJustify
        Caption = 'Documentaci'#243'n aportada por el paciente'
      end
      object Label12: TLabel
        Left = 5
        Top = 352
        Width = 215
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estudios complementarios solicitador por ART'
      end
      object edEnfActual: TMemo
        Left = 4
        Top = 26
        Width = 418
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1000
        TabOrder = 0
      end
      object dcFechaPrim: TDateComboBox
        Left = 149
        Top = 63
        Width = 88
        Height = 21
        TabOrder = 1
      end
      object dcFechaAlta: TDateComboBox
        Left = 321
        Top = 63
        Width = 88
        Height = 21
        TabOrder = 2
      end
      object edAntecedentes: TMemo
        Left = 4
        Top = 102
        Width = 418
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1000
        TabOrder = 3
      end
      object edPuestoTrabajo: TEdit
        Left = 96
        Top = 137
        Width = 326
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 4
      end
      object edDescPuesto: TMemo
        Left = 4
        Top = 175
        Width = 418
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1000
        TabOrder = 5
      end
      object edExamenFisico: TMemo
        Left = 4
        Top = 221
        Width = 418
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1000
        TabOrder = 6
      end
      object edDiagnostico: TEdit
        Left = 65
        Top = 256
        Width = 250
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 250
        TabOrder = 7
      end
      object edPorcentaje: TEdit
        Left = 370
        Top = 256
        Width = 52
        Height = 21
        Anchors = [akTop, akRight]
        MaxLength = 5
        TabOrder = 8
        OnKeyPress = edPorcentajeKeyPress
      end
      object edDocumentacion: TMemo
        Left = 4
        Top = 318
        Width = 418
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1000
        TabOrder = 10
      end
      object edEstudios: TMemo
        Left = 4
        Top = 366
        Width = 418
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 1000
        TabOrder = 11
      end
      inline fraCIE10: TfraCodDesc
        Left = 64
        Top = 280
        Width = 359
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        inherited cmbDescripcion: TArtComboBox
          Left = 54
          Width = 302
        end
        inherited edCodigo: TPatternEdit
          Width = 48
        end
        inherited Propiedades: TPropiedadesFrame
          ShowBajas = True
          TableName = 'CDG_DIAGNOSTICO'
          FieldID = 'DG_CODIGO'
          FieldCodigo = 'DG_CODIGO'
          FieldDesc = 'DG_DESCRIPCION'
          FieldBaja = 'DG_FECHABAJA'
        end
      end
      object chkEnfProfes: TCheckBox
        Left = 244
        Top = 5
        Width = 177
        Height = 17
        Caption = 'Confirma enfermedad profesional'
        TabOrder = 12
      end
    end
    object ScrollBox1: TScrollBox
      Left = 147
      Top = 431
      Width = 797
      Height = 486
      TabOrder = 4
      Visible = False
      object qrEvaluacion: TQuickRep
        Left = 4
        Top = 4
        Width = 816
        Height = 1056
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = sdqConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        IDReport = 0
        Options = [FirstPageHeader, LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poPortrait
        Page.PaperSize = Letter
        Page.Values = (
          100.000000000000000000
          2794.000000000000000000
          100.000000000000000000
          2159.000000000000000000
          100.000000000000000000
          100.000000000000000000
          0.000000000000000000)
        PrinterSettings.Copies = 1
        PrinterSettings.OutputBin = Auto
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.ExtendedDuplex = 0
        PrinterSettings.UseStandardprinter = False
        PrinterSettings.UseCustomBinCode = False
        PrinterSettings.CustomBinCode = 0
        PrinterSettings.UseCustomPaperCode = False
        PrinterSettings.CustomPaperCode = 0
        PrinterSettings.PrintMetaFile = False
        PrintIfEmpty = True
        ReportTitle = 'Evaluaci'#243'n m'#233'dica'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        PrevFormStyle = fsNormal
        PreviewInitialState = wsMaximized
        object TitleBand1: TQRBand
          Left = 38
          Top = 38
          Width = 740
          Height = 975
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            2579.687500000000000000
            1957.916666666667000000)
          BandType = rbDetail
          object QRShape17: TQRShape
            Left = 4
            Top = 667
            Width = 733
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              171.979166666666700000
              10.583333333333330000
              1764.770833333333000000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape12: TQRShape
            Left = 4
            Top = 487
            Width = 733
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              171.979166666666700000
              10.583333333333330000
              1288.520833333333000000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape10: TQRShape
            Left = 4
            Top = 371
            Width = 733
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              10.583333333333330000
              981.604166666666800000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape9: TQRShape
            Left = 4
            Top = 282
            Width = 733
            Height = 81
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              214.312500000000000000
              10.583333333333330000
              746.125000000000000000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRShape1: TQRShape
            Left = 4
            Top = 48
            Width = 733
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              10.583333333333330000
              127.000000000000000000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRLabel1: TQRLabel
            Left = 8
            Top = 54
            Width = 70
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              142.875000000000000000
              185.208333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Siniestro:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape2: TQRShape
            Left = 264
            Top = 48
            Width = 3
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              698.500000000000000000
              127.000000000000000000
              7.937500000000000000)
            Shape = qrsVertLine
            VertAdjust = 0
          end
          object QRLabel2: TQRLabel
            Left = 276
            Top = 54
            Width = 101
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              730.250000000000000000
              142.875000000000000000
              267.229166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Contingencia:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape3: TQRShape
            Left = 433
            Top = 48
            Width = 3
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              1145.645833333333000000
              127.000000000000000000
              7.937500000000000000)
            Shape = qrsVertLine
            VertAdjust = 0
          end
          object QRLabel3: TQRLabel
            Left = 444
            Top = 54
            Width = 104
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1174.750000000000000000
              142.875000000000000000
              275.166666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Provincia ART:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape4: TQRShape
            Left = 4
            Top = 80
            Width = 733
            Height = 54
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              142.875000000000000000
              10.583333333333330000
              211.666666666666700000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRLabel4: TQRLabel
            Left = 8
            Top = 86
            Width = 145
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              227.541666666666700000
              383.645833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Apellido y nombres:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel5: TQRLabel
            Left = 8
            Top = 110
            Width = 40
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              291.041666666666700000
              105.833333333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'CUIL:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlCUIL: TQRLabel
            Left = 168
            Top = 112
            Width = 47
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              444.500000000000000000
              296.333333333333400000
              124.354166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'qrlCUIL'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlTrabajador: TQRLabel
            Left = 168
            Top = 86
            Width = 88
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              444.500000000000000000
              227.541666666666700000
              232.833333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'qrlTrabajador'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlSiniestro: TQRLabel
            Left = 84
            Top = 54
            Width = 74
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              222.250000000000000000
              142.875000000000000000
              195.791666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'qrlSiniestro'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape5: TQRShape
            Left = 4
            Top = 133
            Width = 733
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              10.583333333333330000
              351.895833333333400000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRLabel6: TQRLabel
            Left = 8
            Top = 138
            Width = 84
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              365.125000000000000000
              222.250000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Empleador:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlEmpleador: TQRLabel
            Left = 168
            Top = 138
            Width = 84
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              444.500000000000000000
              365.125000000000000000
              222.250000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'qrlEmpleador'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape6: TQRShape
            Left = 4
            Top = 167
            Width = 733
            Height = 81
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              214.312500000000000000
              10.583333333333330000
              441.854166666666700000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRLabel7: TQRLabel
            Left = 8
            Top = 172
            Width = 143
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              455.083333333333300000
              378.354166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Enfermedad actual:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlEnfermedad: TQRLabel
            Left = 8
            Top = 192
            Width = 725
            Height = 52
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              137.583333333333300000
              21.166666666666670000
              508.000000000000000000
              1918.229166666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlEnfermedad'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape7: TQRShape
            Left = 4
            Top = 247
            Width = 733
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              10.583333333333330000
              653.520833333333400000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRLabel8: TQRLabel
            Left = 8
            Top = 253
            Width = 240
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              669.395833333333400000
              635.000000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Fecha de primera manifestaci'#243'n:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlFechaPriMani: TQRLabel
            Left = 258
            Top = 253
            Width = 106
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              682.625000000000000000
              669.395833333333400000
              280.458333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlFechaPriMani'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape8: TQRShape
            Left = 377
            Top = 247
            Width = 3
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              997.479166666666900000
              653.520833333333400000
              7.937500000000000000)
            Shape = qrsVertLine
            VertAdjust = 0
          end
          object QRLabel9: TQRLabel
            Left = 392
            Top = 253
            Width = 104
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1037.166666666667000000
              669.395833333333400000
              275.166666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Fecha de alta:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlFechaAlta: TQRLabel
            Left = 504
            Top = 253
            Width = 101
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1333.500000000000000000
              669.395833333333400000
              267.229166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlFechaAlta'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlAntecedentes: TQRLabel
            Left = 8
            Top = 307
            Width = 725
            Height = 52
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              137.583333333333300000
              21.166666666666670000
              812.270833333333400000
              1918.229166666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlAntecedentes'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel11: TQRLabel
            Left = 8
            Top = 287
            Width = 469
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              759.354166666666800000
              1240.895833333333000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Antecedentes personales / enfermedad actual / preexistencias:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlPuesto: TQRLabel
            Left = 156
            Top = 376
            Width = 576
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              412.750000000000100000
              994.833333333333400000
              1524.000000000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlPuesto'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel12: TQRLabel
            Left = 8
            Top = 376
            Width = 135
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              994.833333333333400000
              357.187500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Puesto de trabajo:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRSysData1: TQRSysData
            Left = 648
            Top = 8
            Width = 44
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1714.500000000000000000
              21.166666666666670000
              116.416666666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsDate
            Transparent = False
            FontSize = 10
          end
          object QRShape11: TQRShape
            Left = 4
            Top = 397
            Width = 733
            Height = 81
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              214.312500000000000000
              10.583333333333330000
              1050.395833333333000000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRLabel10: TQRLabel
            Left = 8
            Top = 402
            Width = 249
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              1063.625000000000000000
              658.812500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Descripci'#243'n del puesto de trabajo:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlDescripcion: TQRLabel
            Left = 8
            Top = 422
            Width = 725
            Height = 52
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              137.583333333333300000
              21.166666666666670000
              1116.541666666667000000
              1918.229166666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlDescripcion'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlExamen: TQRLabel
            Left = 8
            Top = 512
            Width = 725
            Height = 37
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              97.895833333333340000
              21.166666666666670000
              1354.666666666667000000
              1918.229166666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlExamen'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel14: TQRLabel
            Left = 8
            Top = 492
            Width = 107
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              1301.750000000000000000
              283.104166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ex'#225'men f'#237'sico:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape13: TQRShape
            Left = 4
            Top = 560
            Width = 733
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              10.583333333333330000
              1481.666666666667000000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object qrlDiagnostico: TQRLabel
            Left = 104
            Top = 565
            Width = 332
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              275.166666666666700000
              1494.895833333333000000
              878.416666666666800000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlDiagnostico'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel15: TQRLabel
            Left = 8
            Top = 565
            Width = 91
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              1494.895833333333000000
              240.770833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Diagn'#243'stico:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape14: TQRShape
            Left = 439
            Top = 560
            Width = 3
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              1161.520833333333000000
              1481.666666666667000000
              7.937500000000000000)
            Shape = qrsVertLine
            VertAdjust = 0
          end
          object qrlCie10: TQRLabel
            Left = 540
            Top = 565
            Width = 49
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1428.750000000000000000
              1494.895833333333000000
              129.645833333333300000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlCie10'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel16: TQRLabel
            Left = 446
            Top = 565
            Width = 89
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1180.041666666667000000
              1494.895833333333000000
              235.479166666666700000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'OMS CIE 10:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlIncPres: TQRLabel
            Left = 676
            Top = 565
            Width = 57
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1788.583333333333000000
              1494.895833333333000000
              150.812500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlIncPres'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel17: TQRLabel
            Left = 596
            Top = 565
            Width = 75
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1576.916666666667000000
              1494.895833333333000000
              198.437500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Inc. pres.:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape15: TQRShape
            Left = 590
            Top = 560
            Width = 3
            Height = 27
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              71.437500000000000000
              1561.041666666667000000
              1481.666666666667000000
              7.937500000000000000)
            Shape = qrsVertLine
            VertAdjust = 0
          end
          object QRLabel13: TQRLabel
            Left = 8
            Top = 619
            Width = 725
            Height = 37
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              97.895833333333340000
              21.166666666666670000
              1637.770833333333000000
              1918.229166666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'QRLabel13'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRShape16: TQRShape
            Left = 4
            Top = 594
            Width = 733
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              171.979166666666700000
              10.583333333333330000
              1571.625000000000000000
              1939.395833333333000000)
            Shape = qrsRectangle
            VertAdjust = 0
          end
          object QRLabel18: TQRLabel
            Left = 8
            Top = 599
            Width = 301
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              1584.854166666667000000
              796.395833333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Documentaci'#243'n aportada por el paciente:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlDocumentacion: TQRLabel
            Left = 8
            Top = 618
            Width = 725
            Height = 37
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              97.895833333333340000
              21.166666666666670000
              1635.125000000000000000
              1918.229166666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlDocumentacion'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object qrlEstudios: TQRLabel
            Left = 8
            Top = 691
            Width = 725
            Height = 37
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              97.895833333333340000
              21.166666666666670000
              1828.270833333333000000
              1918.229166666667000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'qrlEstudios'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel20: TQRLabel
            Left = 8
            Top = 672
            Width = 340
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              21.166666666666670000
              1778.000000000000000000
              899.583333333333400000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Estudios complementarios solicitados por ART:'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel19: TQRLabel
            Left = 4
            Top = 856
            Width = 293
            Height = 19
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              50.270833333333330000
              10.583333333333330000
              2264.833333333333000000
              775.229166666666800000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Firma del Damnificado'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel21: TQRLabel
            Left = 444
            Top = 856
            Width = 293
            Height = 19
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              50.270833333333330000
              1174.750000000000000000
              2264.833333333333000000
              775.229166666666800000)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'Firma del M'#233'dico de ART'
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel22: TQRLabel
            Left = 384
            Top = 54
            Width = 17
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1016.000000000000000000
              142.875000000000000000
              44.979166666666670000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'EP'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object QRLabel23: TQRLabel
            Left = 560
            Top = 54
            Width = 141
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.979166666666670000
              1481.666666666667000000
              142.875000000000000000
              373.062500000000000000)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'EVALUACION MEDICA'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
        end
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
    ShortCuts = <
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 0
      end
      item
        Key = 16455
        LinkControl = tbSalir
      end
      item
        Key = 16467
        LinkControl = tbSalir2
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end>
    Left = 276
    Top = 8
  end
  inherited Seguridad: TSeguridad
    DBLogin = frmPrincipal.DBLogin
    Left = 220
    Top = 8
  end
  inherited FormStorage: TFormStorage
    Left = 248
    Top = 8
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT utiles.armar_siniestro(ex_siniestro, ex_orden, ex_recaida' +
        ') siniestro,'
      
        '               em_id, em_idexpediente, em_enfermedadactual, em_a' +
        'ntecedentes, '
      
        '               em_puestotrabajo, em_descpuestotrabajo, em_examen' +
        'fisico,'
      
        '               em_diagnostico, em_cie10, em_incpresunta, em_docu' +
        'aportada, '
      
        '               em_fechaprimanif, em_fechadealta, em_estudioscomp' +
        'lem,'
      
        '               ex_siniestro, ex_orden, ex_recaida, ex_cuil, ex_c' +
        'uit'
      '    FROM cem_evaluacionmedica, sex_expedientes'
      ' WHERE ex_id = em_idexpediente(+)'
      '       AND ex_id = :idexp'
      '')
    Left = 304
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idexp'
        ParamType = ptInput
      end>
  end
  inherited dsConsulta: TDataSource
    Left = 332
    Top = 8
  end
end
