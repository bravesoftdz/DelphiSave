object frmABMNotas: TfrmABMNotas
  Left = 53
  Top = 4
  Width = 725
  Height = 594
  Caption = 'Notas'
  Color = clBtnFace
  Constraints.MinHeight = 594
  Constraints.MinWidth = 725
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnMouseMove = FormMouseMove
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  DesignSize = (
    717
    567)
  PixelsPerInch = 96
  TextHeight = 13
  object lblBibliorato: TLabel
    Left = 11
    Top = 526
    Width = 46
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Bibliorato:'
  end
  object lblSecuencia: TLabel
    Left = 142
    Top = 526
    Width = 54
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Secuencia:'
  end
  object lblSolicitanteSolicitud: TLabel
    Left = 14
    Top = 58
    Width = 52
    Height = 13
    Caption = 'Solicitante:'
  end
  object lblFechaRecepcion: TLabel
    Left = 14
    Top = 131
    Width = 47
    Height = 13
    Caption = 'F.Recep.:'
  end
  object lblFechaRecepcionART: TLabel
    Left = 167
    Top = 131
    Width = 93
    Height = 13
    Caption = 'Fecha Recep.ART:'
  end
  object lblEstado: TLabel
    Left = 11
    Top = 386
    Width = 36
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Estado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblEstadoPrevisto: TLabel
    Left = 624
    Top = 387
    Width = 55
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = '(Previsto)'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblBlockNota: TLabel
    Left = 14
    Top = 155
    Width = 45
    Height = 26
    Caption = 'Block de Notas:'
    WordWrap = True
  end
  object gbCargaNotas: TJvgGroupBox
    Left = 6
    Top = 1
    Width = 702
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Nota '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Border.Inner = bvNone
    Border.Outer = bvNone
    Border.Bold = False
    CaptionAlignment = fcaWidth
    CaptionBorder.Inner = bvRaised
    CaptionBorder.Outer = bvSpace
    CaptionBorder.Bold = False
    CaptionGradient.FromColor = 10461087
    CaptionGradient.ToColor = clSilver
    CaptionGradient.Active = True
    CaptionGradient.Orientation = fgdHorizontal
    CaptionShift.X = 8
    CaptionShift.Y = 0
    CaptionTextStyle = fstVolumetric
    Colors.Text = clHighlightText
    Colors.TextActive = clHighlightText
    Colors.Caption = clBtnShadow
    Colors.CaptionActive = clBtnShadow
    Colors.Client = clBtnFace
    Colors.ClientActive = clBtnFace
    Gradient.FromColor = clBlack
    Gradient.ToColor = clGray
    Gradient.Active = False
    Gradient.Orientation = fgdHorizontal
    Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
    GroupIndex = 2
    FullHeight = 59
  end
  object rgpTipoSolicitante: TRadioGroup
    Left = 8
    Top = 21
    Width = 700
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Tipo de Solicitante '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Usuario'
      'Sector'
      'Otro tipo')
    TabOrder = 1
    OnClick = rgpTipoSolicitanteClick
  end
  inline fraEmpresa: TfraEmpresa
    Left = 4
    Top = 80
    Width = 697
    Height = 44
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    DesignSize = (
      697
      44)
    inherited lbRSocial: TLabel
      Left = 153
      Top = 3
    end
    inherited lbContrato: TLabel
      Left = 11
      Top = 27
      Anchors = [akLeft, akBottom]
    end
    inherited mskCUIT: TMaskEdit
      Left = 67
      Width = 80
    end
    inherited edContrato: TIntEdit
      Left = 67
      Top = 23
      Width = 80
      Anchors = [akLeft, akBottom]
    end
    inherited cmbRSocial: TArtComboBox
      Left = 201
      Width = 489
    end
    inherited sdqDatos: TSDQuery
      SQL.Strings = (
        '')
      Left = 272
      Top = 8
    end
    inherited dsDatos: TDataSource
      Left = 300
      Top = 8
    end
  end
  object lblCUIT: TStaticText
    Left = 15
    Top = 83
    Width = 29
    Height = 17
    Caption = 'CUIT'
    TabOrder = 3
  end
  object edBiblioratoNota: TIntEdit
    Left = 63
    Top = 523
    Width = 71
    Height = 21
    Hint = 'Bibliorato'
    Anchors = [akLeft, akBottom]
    Color = 16051436
    Enabled = False
    ReadOnly = True
    TabOrder = 13
    MaxLength = 3
  end
  object edSecuenciaNota: TIntEdit
    Left = 199
    Top = 523
    Width = 71
    Height = 21
    Hint = 'N'#250'mero de Secuencia'
    Anchors = [akLeft, akBottom]
    Color = 16051436
    Enabled = False
    ReadOnly = True
    TabOrder = 14
    MaxLength = 8
  end
  inline fraSolicitanteNota: TfraCodigoDescripcionExt
    Left = 70
    Top = 54
    Width = 635
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    DesignSize = (
      635
      23)
    inherited cmbDescripcion: TArtComboBox
      Left = 84
      Width = 540
    end
    inherited edCodigo: TPatternEdit
      Width = 80
    end
  end
  object btnBorrador: TButton
    Left = 555
    Top = 524
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Borrador'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = btnBorradorClick
  end
  object edFechaRecepcionEmision: TDateComboBox
    Left = 71
    Top = 127
    Width = 88
    Height = 21
    TabOrder = 5
  end
  object edFechaRecepcionART: TDateComboBox
    Left = 262
    Top = 127
    Width = 88
    Height = 21
    TabOrder = 6
  end
  object pcFormularios: TJvPageControl
    Left = 9
    Top = 210
    Width = 700
    Height = 172
    ActivePage = tbFormSituacionFacturacion
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 9
    TabPosition = tpBottom
    TabStop = False
    OnChange = pcFormulariosChange
    object tbForm931: TTabSheet
      Caption = 'Formulario 931'
      DesignSize = (
        692
        146)
      object dbgForm931: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsForm931
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CODIGORECTIFICATIVA'
            Title.Caption = 'Rectificativa'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_NUMEROVERIFICADOR'
            Title.Caption = 'Nro. Verificador'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_SINEMPLEADOS'
            Title.Caption = 'Sin Empleados'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CONTICKET'
            Title.Caption = 'Con Ticket'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_NUMEROVERIFICADOR_2'
            Title.Caption = 'Nro.Verif.Ticket'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'F.Presentaci'#243'n'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_ERRORV28'
            Title.Caption = 'Error V28'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPONOMINA'
            Title.Caption = 'Tipo N'#243'mina'
            Width = 160
            Visible = True
          end>
      end
    end
    object tbForm165_170: TTabSheet
      Caption = 'Formulario 165/170'
      ImageIndex = 1
      DesignSize = (
        692
        146)
      object dbgForm165_170: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsForm165_170
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TF_DESCRIPCION'
            Title.Caption = 'Formulario'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Width = 66
            Visible = True
          end>
      end
    end
    object tbForm900_926: TTabSheet
      Caption = 'Formulario 900/926'
      ImageIndex = 2
      DesignSize = (
        692
        146)
      object dbgForm900_926: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsForm900_926
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TF_DESCRIPCION'
            Title.Caption = 'Formulario'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Tot. Empleados'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Tot. Masa Salarial'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALHOJAS'
            Title.Caption = 'Tot. Hojas'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CODIGORECTIFICATIVA'
            Title.Caption = 'C'#243'd. Rectificativa'
            Width = 92
            Visible = True
          end>
      end
    end
    object tbForm905: TTabSheet
      Caption = 'Formulario 905'
      ImageIndex = 3
      DesignSize = (
        692
        146)
      object dbgForm905: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsForm905
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CONTICKET'
            Title.Caption = 'Con Ticket'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CODIGORECTIFICATIVA'
            Title.Caption = 'C'#243'd. Rectificativa'
            Width = 95
            Visible = True
          end>
      end
    end
    object tbForm929_569_593: TTabSheet
      Caption = 'Formulario 929/569/593'
      ImageIndex = 4
      DesignSize = (
        692
        146)
      object dbgForm929_569_593: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsForm929_569_593
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TF_DESCRIPCION'
            Title.Caption = 'Formulario'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CONRESUMEN'
            Title.Caption = 'Con Resumen'
            Width = 73
            Visible = True
          end>
      end
    end
    object tbFormNota: TTabSheet
      Caption = 'Formulario Nota'
      ImageIndex = 5
      DesignSize = (
        692
        146)
      object dbgFormNota: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormNota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TEXTONOTA'
            Title.Caption = 'Texto'
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPONOMINA'
            Title.Caption = 'Tipo N'#243'mina'
            Width = 159
            Visible = True
          end>
      end
    end
    object tbForm924_902: TTabSheet
      Caption = 'Formulario 924/902'
      ImageIndex = 6
      DesignSize = (
        692
        146)
      object dbgForm924_902: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsForm924_902
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TF_DESCRIPCION'
            Title.Caption = 'Formulario'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CONTICKET'
            Title.Caption = 'Con Ticket'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CONRESUMEN'
            Title.Caption = 'Con Resumen'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CODIGORECTIFICATIVA'
            Title.Caption = 'C'#243'd. Rectificativa'
            Width = 93
            Visible = True
          end>
      end
    end
    object tbFormResMonoTrib_NoSuss_NoSussCopia: TTabSheet
      Caption = 'R.Mono.Trib.Sol./No Suss/No Suss Copia'
      ImageIndex = 7
      DesignSize = (
        692
        146)
      object dbgFormResMonoTrib_NoSuss_NoSussCopia: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFRMonoTrib_NoSuss_NoSussCopia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TF_DESCRIPCION'
            Title.Caption = 'Formulario'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA'
            Title.Caption = 'Nota Relac.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_ENMIENDA'
            Title.Caption = 'Enmienda'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSCRIPCION'
            Title.Caption = 'Inscripci'#243'n'
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TEXTONOTA'
            Title.Caption = 'Observaci'#243'n'
            Width = 300
            Visible = True
          end>
      end
    end
    object tbForm921: TTabSheet
      Caption = 'Formulario 921'
      ImageIndex = 8
      DesignSize = (
        692
        146)
      object dbgForm921: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsForm921
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_EMPLEADOSCONALTA'
            Title.Caption = 'Empleados Alta'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_EMPLEADOSCONBAJA'
            Title.Caption = 'Empleados Baja'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_CONTICKET'
            Title.Caption = 'Con Ticket'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_NUMEROVERIFICADOR'
            Title.Caption = 'Nro. Verificador'
            Width = 86
            Visible = True
          end>
      end
    end
    object tbFormMixta931_170: TTabSheet
      Caption = 'Informaci'#243'n Mixta (931/170)'
      ImageIndex = 9
      DesignSize = (
        692
        146)
      object dbgFormMixta931_170: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormMixta931_170
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Tot. Empleados'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Tot. Masa Salarial'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORM931'
            Title.Caption = 'Form. 931'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FORM170'
            Title.Caption = 'Form. 170'
            Width = 63
            Visible = True
          end>
      end
    end
    object tbFormTicketPresentacion: TTabSheet
      Caption = 'Formulario Ticket Presentaci'#243'n'
      ImageIndex = 10
      DesignSize = (
        692
        146)
      object dbgFormTicketPresentacion: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormTicketPresentacion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_NUMEROVERIFICADOR'
            Title.Caption = 'Nro. Verificador'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA'
            Title.Caption = 'Nota Relac.'
            Width = 95
            Visible = True
          end>
      end
    end
    object tbFormRCompl924_902: TTabSheet
      Caption = 'Formulario Res.Compl. 924/902'
      ImageIndex = 11
      DesignSize = (
        692
        146)
      object dbgFormResComp924_902: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormRCompl924_902
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA'
            Title.Caption = 'Nota Relac.'
            Width = 106
            Visible = True
          end>
      end
    end
    object tbFormConstMono: TTabSheet
      Caption = 'Constancia Monotributista'
      ImageIndex = 12
      DesignSize = (
        692
        146)
      object dbgFormConstMono: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormConstMonotributista
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA'
            Title.Caption = 'Nota Relac.'
            Width = 100
            Visible = True
          end>
      end
    end
    object tbFormAnexoIIExcep: TTabSheet
      Caption = 'Anexo II Excepciones'
      ImageIndex = 13
      DesignSize = (
        692
        146)
      object dbgAnexoIIExcep: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsAnexoIIExcep
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TF_DESCRIPCION'
            Title.Caption = 'Formulario'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end>
      end
    end
    object tbPagos: TTabSheet
      Caption = 'Pagos'
      ImageIndex = 14
      DesignSize = (
        692
        146)
      object dbgPagos: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormPagos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA'
            Title.Caption = 'Nota Relac.'
            Width = 100
            Visible = True
          end>
      end
    end
    object tbFormConstIncrEmpl: TTabSheet
      Caption = 'Const. Inscripci'#243'n Empl.'
      ImageIndex = 15
      DesignSize = (
        692
        146)
      object dbgConstIncrEmpl: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormConstInscrEmpl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_FECHAINSCRIPCIONEMPL'
            Title.Caption = 'Fecha de Inscripci'#243'n'
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AnulaFechaInscrip'
            Title.Caption = 'Anula F.Inscripci'#243'n'
            Width = 100
            Visible = True
          end>
      end
    end
    object tbFormDocColegios: TTabSheet
      Caption = 'Doc. Colegios'
      ImageIndex = 16
      DesignSize = (
        692
        146)
      object dbgDocColegios: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormDocColegios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AM_CUIL'
            Title.Caption = 'Cuil'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AM_MASAADICIONAL'
            Title.Caption = 'Masa Adic.'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AM_FECHAPRESENTACION'
            Title.Caption = 'Fecha Presentaci'#243'n'
            Width = 109
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXISTEDDJJ'
            Title.Caption = 'Existe DDJJ'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXISTETRAB'
            Title.Caption = 'Existe Trabajador'
            Width = 91
            Visible = True
          end>
      end
    end
    object tbGestionado: TTabSheet
      Caption = 'Gestionado'
      ImageIndex = 17
      DesignSize = (
        692
        146)
      object dbgGestionado: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsGestionado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TEXTOOBSNOTA'
            Title.Caption = 'Texto Nota'
            Width = 95
            Visible = True
          end>
      end
    end
    object tbAdicionarResumen: TTabSheet
      Caption = 'Adicionar a Resumen'
      ImageIndex = 18
      DesignSize = (
        692
        146)
      object dbgAdicionarResumen: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsAdicionarResumen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados a Adic.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial a Adic.'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Pres.'
            Visible = True
          end>
      end
    end
    object tbAdicionarDetalle: TTabSheet
      Caption = 'Adicionar Detalle'
      ImageIndex = 19
      DesignSize = (
        692
        146)
      object dbgAdicionarDetalle: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsAdicionarDetalle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Presentaci'#243'n'
            Width = 109
            Visible = True
          end>
      end
    end
    object tbFormWeb: TTabSheet
      Caption = 'Detalle RNS Web'
      ImageIndex = 20
      DesignSize = (
        692
        146)
      object dbgFormWeb: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormWeb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_PERIODO'
            Title.Caption = 'Per'#237'odo'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALEMPLEADOS'
            Title.Caption = 'Empleados'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASALARIAL'
            Title.Caption = 'Masa Salarial'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NP_TOTALMASASINTOPEAR'
            Title.Caption = 'M.Salarial sin Topear'
            Width = 105
            Visible = True
          end>
      end
    end
    object tbFormSituacionFacturacion: TTabSheet
      Caption = 'Situaci'#243'n Facturaci'#243'n'
      ImageIndex = 21
      DesignSize = (
        692
        146)
      object dbgSituacionFacturacion: TRxDBGrid
        Left = 0
        Top = 1
        Width = 691
        Height = 142
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsFormSitFacturacion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgFormCellClick
        OnDblClick = dbgFormDblClick
        MultiSelect = True
        OnGetCellParams = dbgFormGetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'NP_FECHAPRESENTACION'
            Title.Caption = 'Fecha Presentaci'#243'n'
            Width = 106
            Visible = True
          end>
      end
    end
  end
  object btnCancel: TButton
    Left = 635
    Top = 524
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = '&Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = btnCancelClick
  end
  object btnAplicar: TButton
    Left = 395
    Top = 524
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = '&Aplicar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    OnClick = btnAplicarClick
  end
  object tbComandosDetalle: TToolBar
    Left = 355
    Top = 123
    Width = 99
    Height = 28
    Align = alNone
    BorderWidth = 1
    Caption = 'ToolBar'
    EdgeBorders = []
    Enabled = False
    HotImages = DmEmision.ilByN
    Images = DmEmision.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    object tbAddNomina: TToolButton
      Left = 0
      Top = 2
      Hint = 'Nuevo (Ctrl+N)'
      ImageIndex = 6
      OnClick = tbAddNominaClick
    end
    object tbModifyNomina: TToolButton
      Left = 23
      Top = 2
      Hint = 'Modificar (Ctrl+M)'
      ImageIndex = 7
      OnClick = tbModifyNominaClick
    end
    object tbDeleteNomina: TToolButton
      Left = 46
      Top = 2
      Hint = 'Eliminar (Ctrl+E)'
      ImageIndex = 8
      OnClick = tbDeleteNominaClick
    end
    object tbLimpiarNomina: TToolButton
      Left = 69
      Top = 2
      Hint = 'Limpiar (Ctrl+L)'
      ImageIndex = 1
    end
  end
  object fpEnviarA: TFormPanel
    Left = 139
    Top = 240
    Width = 306
    Height = 110
    Caption = 'Guardar Nota'
    FormWidth = 0
    FormHeigth = 0
    BorderIcons = []
    BorderStyle = bsDialog
    Position = poOwnerFormCenter
    DesignSize = (
      306
      110)
    object Bevel5: TBevel
      Left = 4
      Top = 74
      Width = 298
      Height = 2
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 11
      Top = 28
      Width = 176
      Height = 13
      Caption = 'La nota tiene formularios observados.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 47
      Width = 116
      Height = 13
      Caption = 'Desea enviar la nota a...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnVerificacion: TButton
      Left = 148
      Top = 80
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Verificaci'#243'n'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
    end
    object btnCorregido: TButton
      Left = 226
      Top = 80
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Corregido'
      ModalResult = 4
      TabOrder = 1
    end
    object gbEnviarA: TJvgGroupBox
      Left = 1
      Top = 1
      Width = 304
      Height = 25
      Caption = ' Enviar a...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Border.Inner = bvNone
      Border.Outer = bvNone
      Border.Bold = False
      CaptionAlignment = fcaWidth
      CaptionBorder.Inner = bvRaised
      CaptionBorder.Outer = bvSpace
      CaptionBorder.Bold = False
      CaptionGradient.FromColor = 10461087
      CaptionGradient.ToColor = clSilver
      CaptionGradient.Active = True
      CaptionGradient.Orientation = fgdHorizontal
      CaptionShift.X = 8
      CaptionShift.Y = 0
      CaptionTextStyle = fstVolumetric
      Colors.Text = clHighlightText
      Colors.TextActive = clHighlightText
      Colors.Caption = clBtnShadow
      Colors.CaptionActive = clBtnShadow
      Colors.Client = clBtnFace
      Colors.ClientActive = clBtnFace
      Gradient.FromColor = clBlack
      Gradient.ToColor = clGray
      Gradient.Active = False
      Gradient.Orientation = fgdHorizontal
      Options = [fgoCollapseOther, fgoHideChildrenWhenCollapsed, fgoSaveChildFocus]
      GroupIndex = 2
      FullHeight = 59
    end
  end
  object edEstado: TEdit
    Left = 63
    Top = 384
    Width = 557
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    Color = 16051436
    ReadOnly = True
    TabOrder = 10
  end
  object tbMasObservaciones: TToolBar
    Left = 681
    Top = 381
    Width = 28
    Height = 29
    Align = alNone
    Anchors = [akRight, akBottom]
    BorderWidth = 1
    ButtonHeight = 23
    Caption = 'ToolBar'
    EdgeBorders = []
    Enabled = False
    HotImages = DmEmision.ilByN
    Images = DmEmision.ilColor
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    object tbAddMasObservaciones: TToolButton
      Left = 0
      Top = 2
      Hint = 'M'#225's Observaciones'
      ImageIndex = 23
      OnClick = tbAddMasObservacionesClick
    end
  end
  object edBlockNota: TMemo
    Left = 71
    Top = 150
    Width = 637
    Height = 39
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = 16051436
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 8
  end
  object pcSimulacion: TJvPageControl
    Left = 0
    Top = 410
    Width = 721
    Height = 112
    ActivePage = tbSimulacion
    Anchors = [akLeft, akRight, akBottom]
    MultiLine = True
    TabOrder = 12
    TabPosition = tpRight
    ClientBorderWidth = 0
    object tbNota: TTabSheet
      Caption = 'tbNota'
      DesignSize = (
        683
        112)
      object lblObservacionVerif: TLabel
        Left = 11
        Top = 3
        Width = 51
        Height = 13
        Caption = 'A Verificar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edObservacion: TMemo
        Left = 63
        Top = 1
        Width = 606
        Height = 106
        Anchors = [akLeft, akTop, akRight]
        Color = 16051436
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tbSimulacion: TTabSheet
      Caption = 'tbSimulacion'
      ImageIndex = 1
      DesignSize = (
        683
        112)
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 679
        Height = 107
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Simulaci'#243'n'
        TabOrder = 0
        object lblDevActual: TLabel
          Left = 25
          Top = 18
          Width = 44
          Height = 13
          Caption = 'D.Actual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblDevPrevisto: TLabel
          Left = 190
          Top = 18
          Width = 52
          Height = 13
          Caption = 'D.Previsto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Diferencia: TLabel
          Left = 350
          Top = 18
          Width = 51
          Height = 13
          Caption = 'Diferencia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblCantPerAfectados: TLabel
          Left = 516
          Top = 18
          Width = 72
          Height = 13
          Caption = 'Cant.Per.Afect:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblMontoTotalAplic: TLabel
          Left = 510
          Top = 40
          Width = 80
          Height = 13
          Caption = '$ Tot.de la Aplic:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 330
          Top = 40
          Width = 72
          Height = 13
          Caption = 'Sdo.Acre.Prev:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbledSadoAcreedorActual: TLabel
          Left = 163
          Top = 40
          Width = 80
          Height = 13
          Caption = 'Sdo.Acre.Actual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblPagado: TLabel
          Left = 25
          Top = 40
          Width = 40
          Height = 13
          Caption = 'Pagado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblSalProm: TLabel
          Left = 26
          Top = 61
          Width = 48
          Height = 13
          Caption = 'Sal.Prom.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblCodRecSim: TLabel
          Left = 167
          Top = 61
          Width = 76
          Height = 13
          Caption = 'C'#243'd.Rect.Prev.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblDiferenciaTotVariac: TLabel
          Left = 4
          Top = 85
          Width = 71
          Height = 13
          Caption = 'Dif.Tot.Variac.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblSumaVariacion: TLabel
          Left = 328
          Top = 62
          Width = 75
          Height = 26
          Caption = '$ Suma Variac.:         (Grilla)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object lblSumaVariacionAprob: TLabel
          Left = 485
          Top = 62
          Width = 106
          Height = 26
          Caption = '$ Suma Variac.Aprob.:             (Grilla)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object edDevActual: TCurrencyEdit
          Left = 77
          Top = 15
          Width = 79
          Height = 21
          AutoSize = False
          Color = 16051436
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ZeroEmpty = False
        end
        object edDevPrevisto: TCurrencyEdit
          Left = 244
          Top = 15
          Width = 79
          Height = 21
          AutoSize = False
          Color = 14548991
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          ZeroEmpty = False
        end
        object edDiferencia: TCurrencyEdit
          Left = 404
          Top = 15
          Width = 79
          Height = 21
          AutoSize = False
          Color = clRed
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          ZeroEmpty = False
        end
        object edCantPerAfectados: TIntEdit
          Left = 592
          Top = 15
          Width = 79
          Height = 21
          Hint = 'N'#250'mero de Secuencia'
          Color = 16051436
          Enabled = False
          ReadOnly = True
          TabOrder = 3
          Alignment = taRightJustify
          MaxLength = 8
        end
        object edMontoTotalAplic: TCurrencyEdit
          Left = 592
          Top = 37
          Width = 79
          Height = 21
          AutoSize = False
          Color = 16051436
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          ZeroEmpty = False
        end
        object edSadoAcreedorPrevisto: TCurrencyEdit
          Left = 404
          Top = 37
          Width = 79
          Height = 21
          AutoSize = False
          Color = 7118847
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          ZeroEmpty = False
        end
        object edSadoAcreedorActual: TCurrencyEdit
          Left = 244
          Top = 37
          Width = 79
          Height = 21
          AutoSize = False
          Color = 12703487
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
          ZeroEmpty = False
        end
        object edPagado: TCurrencyEdit
          Left = 77
          Top = 37
          Width = 79
          Height = 21
          AutoSize = False
          Color = 16777173
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          ZeroEmpty = False
        end
        object edSalProm: TCurrencyEdit
          Left = 77
          Top = 59
          Width = 79
          Height = 21
          AutoSize = False
          Color = 16051436
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
          ZeroEmpty = False
        end
        object edCodRectPrev: TIntEdit
          Left = 244
          Top = 59
          Width = 79
          Height = 21
          Hint = 'C'#243'digo de Rectificativa Prevista'
          Color = 16051436
          Enabled = False
          ReadOnly = True
          TabOrder = 9
          MaxLength = 8
        end
        object edDiferenciaTotVariac: TCurrencyEdit
          Left = 77
          Top = 82
          Width = 79
          Height = 21
          AutoSize = False
          Color = clRed
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          ZeroEmpty = False
        end
        object edSumaVariacion: TCurrencyEdit
          Left = 404
          Top = 59
          Width = 79
          Height = 21
          AutoSize = False
          Color = 16051436
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
          ZeroEmpty = False
        end
        object edSumaVariacionAprob: TCurrencyEdit
          Left = 592
          Top = 59
          Width = 79
          Height = 21
          AutoSize = False
          Color = 16051436
          DisplayFormat = ',0.00 $;-,0.00 $'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          MaxValue = 999999999.000000000000000000
          MinValue = -99999999999.000000000000000000
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          ZeroEmpty = False
        end
      end
    end
  end
  object btnASimulacion: TButton
    Left = 475
    Top = 524
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'A &Simulaci'#243'n'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = btnASimulacionClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 547
    Width = 717
    Height = 20
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object pnlHeader: TPanel
    Left = 10
    Top = 189
    Width = 696
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 21
    object pnlCaptions: TPanel
      Left = 0
      Top = 0
      Width = 497
      Height = 24
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lblReferenciaDiferenciaDevengado: TLabel
        Left = 26
        Top = 7
        Width = 48
        Height = 13
        Caption = 'A Verificar'
      end
      object Label3: TLabel
        Left = 102
        Top = 7
        Width = 51
        Height = 13
        Caption = 'Procesado'
      end
      object Label4: TLabel
        Left = 182
        Top = 7
        Width = 68
        Height = 13
        Caption = 'No Procesado'
      end
      object Label6: TLabel
        Left = 278
        Top = 7
        Width = 43
        Height = 13
        Caption = 'Repetido'
      end
      object Label7: TLabel
        Left = 350
        Top = 7
        Width = 52
        Height = 13
        Caption = 'En Gesti'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8587007
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblLeyendaPeriodoPendienteAprob: TLabel
        Left = 431
        Top = 7
        Width = 61
        Height = 13
        Caption = 'Pend.Aprob.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Panel5: TPanel
        Left = 6
        Top = 4
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = clGray
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 82
        Top = 4
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = 14811135
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 162
        Top = 4
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = 12895487
        TabOrder = 2
      end
      object Panel3: TPanel
        Left = 258
        Top = 4
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = 13041606
        TabOrder = 3
      end
      object Panel4: TPanel
        Left = 330
        Top = 4
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 4
      end
      object Panel6: TPanel
        Left = 409
        Top = 4
        Width = 16
        Height = 16
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 5
      end
    end
    object tbarSimulacion: TToolBar
      Left = 497
      Top = 0
      Width = 119
      Height = 24
      Align = alLeft
      Caption = 'ToolBar'
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      HotImages = DmEmision.ilByN
      Images = DmEmision.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object btnAprobar: TToolButton
        Left = 0
        Top = 2
        Hint = 'Aprobar'
        Caption = 'Aprobar'
        ImageIndex = 46
        OnClick = btnAprobarClick
      end
      object btnRechazar: TToolButton
        Left = 23
        Top = 2
        Hint = 'Rechazar'
        Caption = 'Rechazar'
        ImageIndex = 45
        OnClick = btnRechazarClick
      end
      object btnEliminarMarca: TToolButton
        Left = 46
        Top = 2
        Hint = 'Eliminar Marca'
        Caption = 'Eliminar Marca'
        ImageIndex = 1
        OnClick = btnEliminarMarcaClick
      end
      object ToolButton3: TToolButton
        Left = 69
        Top = 2
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnSelectAll: TToolButton
        Left = 77
        Top = 2
        Hint = 'Tipo de selecci'#243'n'
        DropdownMenu = mnuSelect
        ImageIndex = 9
        Style = tbsDropDown
      end
    end
  end
  object btnAgendar: TButton
    Left = 315
    Top = 524
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'A&gendar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    OnClick = btnAgendarClick
  end
  object dsForm931: TDataSource
    DataSet = sdqForm931
    Left = 72
    Top = 248
  end
  object sdqForm931: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT INP.*, emi.notas.get_estadoformulario(np_idestadoformular' +
        'io) Estado,'
      
        'emi.notas.get_estadoformulario(np_idestadoformulariosim) EstadoS' +
        'im,'
      'emi.notas.get_observacionformulario(np_id) obs,'
      'tn_descripcion TipoNomina'
      'FROM EMI.INP_NOTACONTRATOPERIODO INP, EMI.ITN_TIPONOMINA'
      'WHERE NP_IDNOTA = :idNota'
      'AND NP_IDTIPOFORMULARIO = 1'
      'AND NP_FORMULARIOMIXTO = '#39'N'#39
      'AND NP_IDTIPONOMINA = TN_ID(+)'
      'ORDER BY NP_PERIODO')
    Left = 100
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqForm931NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqForm931NP_IDNOTA: TFloatField
      FieldName = 'NP_IDNOTA'
      Required = True
    end
    object sdqForm931NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqForm931NP_USUALTA: TStringField
      FieldName = 'NP_USUALTA'
      Required = True
    end
    object sdqForm931NP_FECHAALTA: TDateTimeField
      FieldName = 'NP_FECHAALTA'
      Required = True
    end
    object sdqForm931NP_USUMODIF: TStringField
      FieldName = 'NP_USUMODIF'
    end
    object sdqForm931NP_FECHAMODIF: TDateTimeField
      FieldName = 'NP_FECHAMODIF'
    end
    object sdqForm931NP_USUBAJA: TStringField
      FieldName = 'NP_USUBAJA'
    end
    object sdqForm931NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqForm931NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqForm931NP_IDDDJJ: TFloatField
      FieldName = 'NP_IDDDJJ'
    end
    object sdqForm931NP_IDSOLICITUDAUTORIZACION: TFloatField
      FieldName = 'NP_IDSOLICITUDAUTORIZACION'
    end
    object sdqForm931NP_CODIGORECTIFICATIVA: TStringField
      FieldName = 'NP_CODIGORECTIFICATIVA'
      Size = 2
    end
    object sdqForm931NP_NUMEROVERIFICADOR: TStringField
      FieldName = 'NP_NUMEROVERIFICADOR'
      Size = 6
    end
    object sdqForm931NP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqForm931NP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqForm931NP_SINEMPLEADOS: TStringField
      FieldName = 'NP_SINEMPLEADOS'
      Size = 1
    end
    object sdqForm931NP_CONTICKET: TStringField
      FieldName = 'NP_CONTICKET'
      Size = 1
    end
    object sdqForm931NP_NUMEROVERIFICADOR_2: TStringField
      FieldName = 'NP_NUMEROVERIFICADOR_2'
      Size = 6
    end
    object sdqForm931NP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqForm931NP_IDINSCRIPCION: TFloatField
      FieldName = 'NP_IDINSCRIPCION'
    end
    object sdqForm931NP_TOTALHOJAS: TFloatField
      FieldName = 'NP_TOTALHOJAS'
    end
    object sdqForm931NP_CONRESUMEN: TStringField
      FieldName = 'NP_CONRESUMEN'
      Size = 1
    end
    object sdqForm931NP_TEXTONOTA: TStringField
      FieldName = 'NP_TEXTONOTA'
      Size = 4000
    end
    object sdqForm931NP_ENMIENDA: TStringField
      FieldName = 'NP_ENMIENDA'
      Size = 1
    end
    object sdqForm931NP_EMPLEADOSCONALTA: TFloatField
      FieldName = 'NP_EMPLEADOSCONALTA'
    end
    object sdqForm931NP_EMPLEADOSCONBAJA: TFloatField
      FieldName = 'NP_EMPLEADOSCONBAJA'
    end
    object sdqForm931NP_FORMULARIOMIXTO: TStringField
      FieldName = 'NP_FORMULARIOMIXTO'
      Required = True
      Size = 1
    end
    object sdqForm931NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqForm931NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqForm931NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqForm931NP_IDNOTAPERIODORELACIONADA: TFloatField
      FieldName = 'NP_IDNOTAPERIODORELACIONADA'
    end
    object sdqForm931NP_TIPORELACION: TStringField
      FieldName = 'NP_TIPORELACION'
      Size = 1
    end
    object sdqForm931NP_TIPOFORMULARIOPRESENTADO: TFloatField
      FieldName = 'NP_TIPOFORMULARIOPRESENTADO'
    end
    object sdqForm931NP_FECHABAJACONTRATO: TDateTimeField
      FieldName = 'NP_FECHABAJACONTRATO'
    end
    object sdqForm931NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqForm931NP_FECHAINSCRIPCIONEMPL: TDateTimeField
      FieldName = 'NP_FECHAINSCRIPCIONEMPL'
    end
    object sdqForm931NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqForm931ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqForm931ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqForm931OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqForm931CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqForm931NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
      BlobType = ftOraBlob
    end
    object sdqForm931NP_ESTADOHISTORICO: TStringField
      FieldName = 'NP_ESTADOHISTORICO'
      Size = 1
    end
    object sdqForm931NP_DERIVADOHISTORICO: TStringField
      FieldName = 'NP_DERIVADOHISTORICO'
    end
    object sdqForm931NP_IDTIPOFORMULARIOHIST: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIOHIST'
    end
    object sdqForm931NP_ERRORV28: TStringField
      FieldName = 'NP_ERRORV28'
      Size = 1
    end
    object sdqForm931NP_IDTIPONOMINA: TFloatField
      FieldName = 'NP_IDTIPONOMINA'
    end
    object sdqForm931TIPONOMINA: TStringField
      FieldName = 'TIPONOMINA'
      Required = True
      Size = 150
    end
  end
  object sdqNota: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    SQL.Strings = (
      'SELECT *'
      'FROM EMI.INO_NOTA'
      'WHERE NO_ID = :idNota'
      '')
    Left = 490
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
  end
  object dsForm165_170: TDataSource
    DataSet = sdqForm165_170
    Left = 128
    Top = 248
  end
  object sdqForm165_170: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_tot' +
        'alempleados,'
      '         np_totalmasasalarial, np_fechapresentacion,'
      '         DECODE (np_idinscripcion,'
      '                 1, '#39'Monotributista'#39','
      '                 2, '#39'Indeterminado'#39','
      '                 3, '#39'Suss'#39','
      '                 '#39#39
      '                ) inscripcion,'
      
        '           np_fechabaja, np_id, np_observacion, emi.notas.get_es' +
        'tadoformulario(np_idestadoformulario) Estado,'
      
        '    emi.notas.get_estadoformulario(np_idestadoformulariosim) Est' +
        'adoSim,'
      '    emi.notas.get_observacionformulario(np_id) obs,'
      
        '    np_idestadoformulario, np_idestadoformulariosim, np_fechabaj' +
        'a, np_ilegible, NP_ACEPTACION, NP_TEXTOOBSNOTA '
      '    FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND (np_idtipoformulario = 2 OR np_idtipoformulario = 3)'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo')
    Left = 156
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqForm165_170NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqForm165_170TF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqForm165_170NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqForm165_170NP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqForm165_170NP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqForm165_170NP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqForm165_170INSCRIPCION: TStringField
      FieldName = 'INSCRIPCION'
      Size = 14
    end
    object sdqForm165_170NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqForm165_170NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqForm165_170NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqForm165_170ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqForm165_170ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqForm165_170OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqForm165_170NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqForm165_170NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqForm165_170NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqForm165_170NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqForm165_170NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqForm165_170CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqForm165_170NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsFormMixta931_170: TDataSource
    DataSet = sdqFormMixta931_170
    Left = 296
    Top = 276
  end
  object sdqFormMixta931_170: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   inp.np_periodo, inp.np_totalempleados, inp.np_totalmasa' +
        'salarial,'
      '         NVL ((SELECT '#39'S'#39
      '                 FROM emi.inm_notacontratoperiodomixto inm,'
      '                      emi.inp_notacontratoperiodo inp2'
      
        '                WHERE  inp2.np_id = inm.nm_idnotacontratoperiodo' +
        'mixto'
      '                  AND inm.nm_idnotacontratoperiodo = inp.np_id'
      '                  AND inp2.np_idtipoformulario = 1),'
      '              '#39'N'#39
      '             ) form931,'
      '         NVL ((SELECT '#39'S'#39
      '                 FROM emi.inm_notacontratoperiodomixto inm,'
      '                      emi.inp_notacontratoperiodo inp2'
      
        '                WHERE inp2.np_id = inm.nm_idnotacontratoperiodom' +
        'ixto'
      '                  AND inm.nm_idnotacontratoperiodo = inp.np_id'
      '                  AND inp2.np_idtipoformulario = 3),'
      '              '#39'N'#39
      
        '             ) form170, np_fechabaja, np_id, np_idtipoformulario' +
        ', np_observacion, '
      
        '             emi.notas.get_estadoformulario(np_idestadoformulari' +
        'o) Estado,'
      
        '             emi.notas.get_estadoformulario(np_idestadoformulari' +
        'osim) EstadoSim,'
      '             emi.notas.get_observacionformulario(np_id) obs,'
      
        'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja, n' +
        'p_ilegible, np_aceptacion, NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo inp'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 34'
      '     AND np_formulariomixto = '#39'N'#39
      'ORDER BY np_periodo')
    Left = 324
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFormMixta931_170NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormMixta931_170NP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqFormMixta931_170NP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqFormMixta931_170FORM931: TStringField
      FieldName = 'FORM931'
      Size = 1
    end
    object sdqFormMixta931_170FORM170: TStringField
      FieldName = 'FORM170'
      Size = 1
    end
    object sdqFormMixta931_170NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormMixta931_170NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormMixta931_170NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormMixta931_170NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormMixta931_170ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormMixta931_170ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormMixta931_170OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormMixta931_170NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormMixta931_170NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormMixta931_170NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormMixta931_170NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormMixta931_170NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormMixta931_170CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormMixta931_170NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsForm900_926: TDataSource
    DataSet = sdqForm900_926
    Left = 184
    Top = 248
  end
  object sdqForm900_926: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_tot' +
        'alempleados,'
      
        '         np_totalmasasalarial, np_fechapresentacion, np_totalhoj' +
        'as,'
      
        '         np_codigorectificativa, np_fechabaja, np_id, np_observa' +
        'cion, emi.notas.get_estadoformulario(np_idestadoformulario) Esta' +
        'do,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      
        '         np_idestadoformulario, np_idestadoformulariosim, np_fec' +
        'habaja, np_ilegible, NP_ACEPTACION, NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND (np_idtipoformulario = 5 OR np_idtipoformulario = 18)'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 212
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqForm900_926NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqForm900_926TF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqForm900_926NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqForm900_926NP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqForm900_926NP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqForm900_926NP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqForm900_926NP_TOTALHOJAS: TFloatField
      FieldName = 'NP_TOTALHOJAS'
    end
    object sdqForm900_926NP_CODIGORECTIFICATIVA: TStringField
      FieldName = 'NP_CODIGORECTIFICATIVA'
      Size = 2
    end
    object sdqForm900_926NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqForm900_926NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqForm900_926NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqForm900_926ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqForm900_926ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqForm900_926OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqForm900_926NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqForm900_926NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqForm900_926NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqForm900_926NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqForm900_926NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqForm900_926CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqForm900_926NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsForm905: TDataSource
    DataSet = sdqForm905
    Left = 240
    Top = 248
  end
  object sdqForm905: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      'SELECT   np_periodo, np_conticket, np_fechapresentacion,'
      
        '         np_codigorectificativa, np_fechabaja, np_id, np_idtipof' +
        'ormulario, '
      
        '         np_observacion, emi.notas.get_estadoformulario(np_idest' +
        'adoformulario) Estado,'
      
        'emi.notas.get_estadoformulario(np_idestadoformulariosim) EstadoS' +
        'im,'
      'emi.notas.get_observacionformulario(np_id) obs,'
      
        'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja, n' +
        'p_ilegible, NP_ACEPTACION, NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 6'
      '     AND np_formulariomixto = '#39'N'#39
      'ORDER BY np_periodo'
      '')
    Left = 268
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqForm905NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqForm905NP_CONTICKET: TStringField
      FieldName = 'NP_CONTICKET'
      Size = 1
    end
    object sdqForm905NP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqForm905NP_CODIGORECTIFICATIVA: TStringField
      FieldName = 'NP_CODIGORECTIFICATIVA'
      Size = 2
    end
    object sdqForm905NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqForm905NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqForm905NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqForm905NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqForm905ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqForm905ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqForm905OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqForm905NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqForm905NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqForm905NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqForm905NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqForm905NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqForm905CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqForm905NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsForm929_569_593: TDataSource
    DataSet = sdqForm929_569_593
    Left = 296
    Top = 248
  end
  object sdqForm929_569_593: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, '
      
        '                 np_conresumen, np_fechabaja, np_id, np_observac' +
        'ion, emi.notas.get_estadoformulario(np_idestadoformulario) Estad' +
        'o,'
      
        '                 emi.notas.get_estadoformulario(np_idestadoformu' +
        'lariosim) EstadoSim,'
      '                 emi.notas.get_observacionformulario(np_id) obs,'
      
        'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja, n' +
        'p_ilegible, NP_ACEPTACION, NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      
        '     AND (np_idtipoformulario = 7 OR np_idtipoformulario = 33 OR' +
        ' np_idtipoformulario = 82)'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 324
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqForm929_569_593NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqForm929_569_593TF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqForm929_569_593NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqForm929_569_593NP_CONRESUMEN: TStringField
      FieldName = 'NP_CONRESUMEN'
      Size = 1
    end
    object sdqForm929_569_593NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqForm929_569_593NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqForm929_569_593NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqForm929_569_593ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqForm929_569_593ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqForm929_569_593OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqForm929_569_593NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqForm929_569_593NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqForm929_569_593NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqForm929_569_593NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqForm929_569_593NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqForm929_569_593CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqForm929_569_593NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsFormNota: TDataSource
    DataSet = sdqFormNota
    Left = 72
    Top = 276
  end
  object sdqFormNota: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      'SELECT   np_periodo, np_totalempleados, np_totalmasasalarial,'
      
        '         np_fechapresentacion, np_textonota, np_fechabaja, np_id' +
        ','
      
        '         np_idtipoformulario, np_observacion, emi.notas.get_esta' +
        'doformulario(np_idestadoformulario) Estado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      
        '         np_idestadoformulario, np_idestadoformulariosim, np_fec' +
        'habaja, np_ilegible, NP_ACEPTACION, NP_TEXTOOBSNOTA,'
      '         tn_descripcion tiponomina'
      '    FROM emi.itn_tiponomina, emi.inp_notacontratoperiodo'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 15'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND np_idtiponomina = tn_id(+)'
      'ORDER BY np_periodo'
      ''
      '')
    Left = 100
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFormNotaNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormNotaNP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqFormNotaNP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqFormNotaNP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqFormNotaNP_TEXTONOTA: TStringField
      FieldName = 'NP_TEXTONOTA'
      Size = 4000
    end
    object sdqFormNotaNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormNotaNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormNotaNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormNotaNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormNotaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormNotaESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormNotaOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormNotaNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormNotaNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormNotaNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormNotaNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormNotaNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormNotaCHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormNotaNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
    object sdqFormNotaTIPONOMINA: TStringField
      FieldName = 'TIPONOMINA'
      Size = 150
    end
  end
  object dsForm924_902: TDataSource
    DataSet = sdqForm924_902
    Left = 128
    Top = 276
  end
  object sdqForm924_902: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_con' +
        'resumen,'
      
        '         np_totalempleados, np_conticket, np_codigorectificativa' +
        ','
      
        '         np_fechapresentacion, np_totalmasasalarial, np_fechabaj' +
        'a, np_id, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) E' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      
        'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja, n' +
        'p_ilegible, np_aceptacion, NP_TEXTOOBSNOTA '
      'FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND (   np_idtipoformulario = 20'
      '          OR np_idtipoformulario = 28'
      '         )'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 156
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqForm924_902NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqForm924_902TF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqForm924_902NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqForm924_902NP_CONRESUMEN: TStringField
      FieldName = 'NP_CONRESUMEN'
      Size = 1
    end
    object sdqForm924_902NP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqForm924_902NP_CONTICKET: TStringField
      FieldName = 'NP_CONTICKET'
      Size = 1
    end
    object sdqForm924_902NP_CODIGORECTIFICATIVA: TStringField
      FieldName = 'NP_CODIGORECTIFICATIVA'
      Size = 2
    end
    object sdqForm924_902NP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqForm924_902NP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqForm924_902NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqForm924_902NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqForm924_902NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqForm924_902ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqForm924_902ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqForm924_902OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqForm924_902NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqForm924_902NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqForm924_902NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqForm924_902NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqForm924_902NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqForm924_902CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqForm924_902NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsFRMonoTrib_NoSuss_NoSussCopia: TDataSource
    DataSet = sdqFRMonoTrib_NoSuss_NoSussCopia
    Left = 184
    Top = 276
  end
  object sdqFRMonoTrib_NoSuss_NoSussCopia: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_enm' +
        'ienda,'
      '         np_totalempleados, np_totalmasasalarial, NP_TEXTONOTA, '
      
        '         np_fechapresentacion, np_fechabaja, np_id, np_observaci' +
        'on,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) E' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      'np_idestadoformulario, np_idestadoformulariosim,'
      '         DECODE (np_idinscripcion,'
      '                 1, '#39'Monotributista'#39','
      '                 2, '#39'Indeterminado'#39','
      '                 '#39#39
      '                ) inscripcion,'
      
        'EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA,' +
        ' np_fechabaja, np_ilegible, np_aceptacion, NP_TEXTOOBSNOTA'
      'FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND (   np_idtipoformulario = 21'
      '          OR np_idtipoformulario = 46'
      '          OR np_idtipoformulario = 47'
      '         )'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 212
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFRMonoTrib_NoSuss_NoSussCopiaCHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaTF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ENMIENDA: TStringField
      FieldName = 'NP_ENMIENDA'
      Size = 1
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TEXTONOTA: TStringField
      FieldName = 'NP_TEXTONOTA'
      Size = 4000
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaINSCRIPCION: TStringField
      FieldName = 'INSCRIPCION'
      Size = 14
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNOTA: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFRMonoTrib_NoSuss_NoSussCopiaNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
      BlobType = ftOraBlob
    end
  end
  object dsForm921: TDataSource
    DataSet = sdqForm921
    Left = 240
    Top = 276
  end
  object sdqForm921: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_periodo, np_conticket, np_fechapresentacion, np_empl' +
        'eadosconalta,'
      
        '         np_empleadosconbaja, np_numeroverificador, np_fechabaja' +
        ', '
      '         np_id, np_idtipoformulario, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) E' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      
        'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja, n' +
        'p_ilegible, np_aceptacion, NP_TEXTOOBSNOTA '
      '    FROM emi.inp_notacontratoperiodo'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 52'
      '     AND np_formulariomixto = '#39'N'#39
      'ORDER BY np_periodo'
      '')
    Left = 268
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqForm921NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqForm921NP_CONTICKET: TStringField
      FieldName = 'NP_CONTICKET'
      Size = 1
    end
    object sdqForm921NP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqForm921NP_EMPLEADOSCONALTA: TFloatField
      FieldName = 'NP_EMPLEADOSCONALTA'
    end
    object sdqForm921NP_EMPLEADOSCONBAJA: TFloatField
      FieldName = 'NP_EMPLEADOSCONBAJA'
    end
    object sdqForm921NP_NUMEROVERIFICADOR: TStringField
      FieldName = 'NP_NUMEROVERIFICADOR'
      Size = 6
    end
    object sdqForm921NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqForm921NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqForm921NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqForm921NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqForm921ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqForm921ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqForm921OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqForm921NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqForm921NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqForm921NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqForm921NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqForm921NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqForm921CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqForm921NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsFormTicketPresentacion: TDataSource
    DataSet = sdqFormTicketPresentacion
    Left = 72
    Top = 305
  end
  object sdqFormTicketPresentacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      'SELECT   np_periodo, np_numeroverificador,'
      
        '         np_fechapresentacion, np_fechabaja, np_id, np_idtipofor' +
        'mulario, np_observacion,'
      
        '        emi.notas.get_estadoformulario(np_idestadoformulario) Es' +
        'tado,'
      
        '        emi.notas.get_estadoformulario(np_idestadoformulariosim)' +
        ' EstadoSim,'
      '        emi.notas.get_observacionformulario(np_id) obs,'
      'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja,'
      
        'EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA,' +
        ' np_ilegible, np_aceptacion, NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 35'
      '     AND np_formulariomixto = '#39'N'#39
      'ORDER BY np_periodo'
      '')
    Left = 100
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFormTicketPresentacionNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormTicketPresentacionNP_NUMEROVERIFICADOR: TStringField
      FieldName = 'NP_NUMEROVERIFICADOR'
      Size = 6
    end
    object sdqFormTicketPresentacionNP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqFormTicketPresentacionNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormTicketPresentacionNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormTicketPresentacionNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormTicketPresentacionNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormTicketPresentacionESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormTicketPresentacionESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormTicketPresentacionOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormTicketPresentacionNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormTicketPresentacionNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormTicketPresentacionNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormTicketPresentacionNOTA: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object sdqFormTicketPresentacionNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormTicketPresentacionNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormTicketPresentacionCHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormTicketPresentacionNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsFormRCompl924_902: TDataSource
    DataSet = sdqFormRCompl924_902
    Left = 128
    Top = 305
  end
  object sdqFormRCompl924_902: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      'SELECT   np_periodo,'
      
        '         np_totalmasasalarial, np_fechabaja, np_id, np_idtipofor' +
        'mulario, '
      '         np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) E' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja,'
      
        'EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA,' +
        ' np_ilegible, np_aceptacion, NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 42'
      '     AND np_formulariomixto = '#39'N'#39
      'ORDER BY np_periodo'
      ''
      ''
      ''
      '')
    Left = 156
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFormRCompl924_902NP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormRCompl924_902NP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqFormRCompl924_902NP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormRCompl924_902NP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormRCompl924_902NP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormRCompl924_902NP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormRCompl924_902ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormRCompl924_902ESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormRCompl924_902OBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormRCompl924_902NP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormRCompl924_902NP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormRCompl924_902NP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormRCompl924_902NOTA: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object sdqFormRCompl924_902NP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormRCompl924_902NP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormRCompl924_902CHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormRCompl924_902NP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object spGetBiblioratoSecuencia: TSDStoredProc
    DatabaseName = 'dbprincipal'
    Options = []
    StoredProcName = 'emi.notas.get_biblioratosecuencia'
    Left = 464
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'AIDNOTA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ABIBLIORATO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'ASECUENCIA'
        ParamType = ptOutput
      end>
  end
  object dsFormConstMonotributista: TDataSource
    DataSet = sdqFormConstMonotributista
    Left = 184
    Top = 305
  end
  object sdqFormConstMonotributista: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_fec' +
        'habaja, np_id, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) E' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      'np_idestadoformulario, np_idestadoformulariosim,'
      
        'EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA,' +
        ' np_fechabaja, np_ilegible, np_aceptacion, NP_TEXTOOBSNOTA'
      'FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 84'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 212
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFormConstMonotributistaNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormConstMonotributistaTF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqFormConstMonotributistaNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormConstMonotributistaNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormConstMonotributistaNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormConstMonotributistaNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormConstMonotributistaESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormConstMonotributistaESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormConstMonotributistaOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormConstMonotributistaNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormConstMonotributistaNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormConstMonotributistaNOTA: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object sdqFormConstMonotributistaNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormConstMonotributistaNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormConstMonotributistaNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormConstMonotributistaCHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormConstMonotributistaNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsAnexoIIExcep: TDataSource
    DataSet = sdqAnexoIIExcep
    Left = 240
    Top = 305
  end
  object sdqAnexoIIExcep: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, '
      
        '                 np_fechabaja, np_id, np_observacion, emi.notas.' +
        'get_estadoformulario(np_idestadoformulario) Estado,'
      
        '                 emi.notas.get_estadoformulario(np_idestadoformu' +
        'lariosim) EstadoSim,'
      '                 emi.notas.get_observacionformulario(np_id) obs,'
      
        'np_idestadoformulario, np_idestadoformulariosim, np_fechabaja, n' +
        'p_ilegible, np_aceptacion, NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 31'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 268
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqAnexoIIExcepNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqAnexoIIExcepTF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqAnexoIIExcepNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqAnexoIIExcepNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqAnexoIIExcepNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqAnexoIIExcepNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqAnexoIIExcepESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqAnexoIIExcepESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqAnexoIIExcepOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqAnexoIIExcepNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqAnexoIIExcepNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqAnexoIIExcepNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqAnexoIIExcepNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqAnexoIIExcepNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqAnexoIIExcepCHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqAnexoIIExcepNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsFormPagos: TDataSource
    DataSet = sdqFormPagos
    Left = 296
    Top = 305
  end
  object sdqFormPagos: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_fec' +
        'habaja, np_id, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) E' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      'np_idestadoformulario, np_idestadoformulariosim,'
      
        'EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA,' +
        ' np_fechabaja, np_ilegible, np_aceptacion, NP_TEXTOOBSNOTA'
      'FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 19'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 324
    Top = 305
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFormPagosNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormPagosTF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqFormPagosNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormPagosNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormPagosNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormPagosNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormPagosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormPagosESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormPagosOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormPagosNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormPagosNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormPagosNOTA: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object sdqFormPagosNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormPagosNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormPagosNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormPagosCHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormPagosNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object ShortCut: TShortCutControl
    ShortCuts = <
      item
        Key = 116
      end
      item
        Key = 16462
        LinkControl = tbAddNomina
      end
      item
        Key = 16461
        LinkControl = tbModifyNomina
      end
      item
        Key = 16430
      end
      item
        Key = 16460
        LinkControl = tbLimpiarNomina
      end
      item
        Key = 16463
      end
      item
        Key = 16457
      end
      item
        Key = 16453
        LinkControl = tbDeleteNomina
      end
      item
        Key = 16467
      end
      item
        Key = 0
        LinkControl = btnAplicar
      end>
    Left = 456
    Top = 248
  end
  object Seguridad: TSeguridad
    AutoEjecutar = False
    Claves = <>
    DBLogin = DBLogin
    PermitirEdicion = True
    Left = 28
    Top = 284
  end
  object DBLogin: TDBLogin
    DataBaseName = dmPrincipal.sdbPrincipal
    AutoExecute = True
    UseNetworkUser = True
    CheckServerDate = True
    AutoEjecutar = True
    Left = 28
    Top = 256
  end
  object AppEvents: TJvAppEvents
    OnIdle = AppEventsIdle
    Left = 29
    Top = 312
  end
  object IdleTimer: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = IdleTimerTimer
    Left = 29
    Top = 228
  end
  object dsFormConstInscrEmpl: TDataSource
    DataSet = sdqFormConstInscrEmpl
    Left = 73
    Top = 333
  end
  object sdqFormConstInscrEmpl: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_fec' +
        'habaja, np_id, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) E' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      'np_idestadoformulario, np_idestadoformulariosim,'
      
        'EMI.NOTAS.GET_NOTARELACIONADA(NP_IDNOTAPERIODORELACIONADA) NOTA,' +
        ' np_fechabaja, np_ilegible, '
      'NP_FECHAINSCRIPCIONEMPL, np_aceptacion,'
      
        'nvl2(NP_FECHAINSCRIPCIONEMPL, '#39'N'#39', '#39'S'#39')  AnulaFechaInscrip, NP_T' +
        'EXTOOBSNOTA'
      'FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 53'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo'
      '')
    Left = 101
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object sdqFormConstInscrEmplNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormConstInscrEmplTF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqFormConstInscrEmplNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormConstInscrEmplNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormConstInscrEmplNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormConstInscrEmplNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormConstInscrEmplESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormConstInscrEmplESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormConstInscrEmplOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormConstInscrEmplNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormConstInscrEmplNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormConstInscrEmplNOTA: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object sdqFormConstInscrEmplNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormConstInscrEmplNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormConstInscrEmplNP_FECHAINSCRIPCIONEMPL: TDateTimeField
      FieldName = 'NP_FECHAINSCRIPCIONEMPL'
    end
    object sdqFormConstInscrEmplNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormConstInscrEmplCHECK_ESTADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormConstInscrEmplAnulaFechaInscrip: TStringField
      FieldName = 'AnulaFechaInscrip'
      Size = 1
    end
    object sdqFormConstInscrEmplNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsFormDocColegios: TDataSource
    DataSet = sdqFormDocColegios
    Left = 129
    Top = 333
  end
  object sdqFormDocColegios: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_fec' +
        'habaja, np_id, np_observacion,'
      
        '--         emi.notas.get_estadoformulario(np_idestadoformulario)' +
        ' estado,'
      
        '         decode(am_iddttrabajador, null,  '#39'No Procesado'#39', '#39'Proce' +
        'sado'#39')  estado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') estadosim, emi.notas.get_observacionformulario(np_id) obs,'
      
        '         np_idestadoformulario, np_idestadoformulariosim, emi.no' +
        'tas.get_notarelacionada(np_idnotaperiodorelacionada) nota,'
      
        '         np_fechabaja, np_ilegible, np_fechainscripcionempl, np_' +
        'aceptacion, am_cuil, am_masaadicional, am_fechapresentacion, '
      
        '         decode(am_idddjj, null, '#39'N'#39', '#39'S'#39') ExisteDDJJ, decode(am' +
        '_iddttrabajador, null, '#39'N'#39', '#39'S'#39') ExisteTrab, NP_TEXTOOBSNOTA'
      
        '    FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario, em' +
        'i.iam_adicionalmasa'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 86'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      '     AND am_idnotacontratoperiodo = np_id'
      'ORDER BY np_idtipoformulario, np_periodo')
    Left = 157
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object StringField1: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object StringField2: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object FloatField2: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object StringField4: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object StringField5: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object StringField6: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object FloatField3: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object FloatField4: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object StringField7: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object StringField8: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'NP_FECHAINSCRIPCIONEMPL'
    end
    object StringField9: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object StringField10: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormDocColegiosAM_CUIL: TStringField
      FieldName = 'AM_CUIL'
      Required = True
      Size = 11
    end
    object sdqFormDocColegiosAM_MASAADICIONAL: TFloatField
      FieldName = 'AM_MASAADICIONAL'
      Required = True
    end
    object sdqFormDocColegiosAM_FECHAPRESENTACION: TDateTimeField
      FieldName = 'AM_FECHAPRESENTACION'
    end
    object sdqFormDocColegiosEXISTEDDJJ: TStringField
      FieldName = 'EXISTEDDJJ'
      Size = 1
    end
    object sdqFormDocColegiosEXISTETRAB: TStringField
      FieldName = 'EXISTETRAB'
      Size = 1
    end
    object sdqFormDocColegiosNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
    end
  end
  object dsGestionado: TDataSource
    DataSet = sdqGestionado
    Left = 185
    Top = 333
  end
  object sdqGestionado: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_fec' +
        'habaja, np_id, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulario) e' +
        'stado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') estadosim, emi.notas.get_observacionformulario(np_id) obs,'
      
        '         np_idestadoformulario, np_idestadoformulariosim, emi.no' +
        'tas.get_notarelacionada(np_idnotaperiodorelacionada) nota,'
      
        '         np_fechabaja, np_ilegible, np_fechainscripcionempl, np_' +
        'aceptacion, np_textonota, np_textoobsnota'
      '    FROM emi.inp_notacontratoperiodo, emi.itf_tipoformulario'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 36'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      'ORDER BY np_idtipoformulario, np_periodo')
    Left = 213
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object FloatField5: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object StringField11: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object StringField12: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object FloatField6: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object StringField13: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object StringField14: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object StringField15: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object StringField16: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object FloatField7: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object FloatField8: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object StringField17: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object StringField18: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'NP_FECHAINSCRIPCIONEMPL'
    end
    object StringField19: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object StringField20: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqGestionadoNP_TEXTONOTA: TStringField
      FieldName = 'NP_TEXTONOTA'
      Size = 4000
    end
    object sdqGestionadoNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
      BlobType = ftOraBlob
    end
  end
  object mnuSelect: TPopupMenu
    Left = 650
    Top = 118
    object mnuSeleccionarTodo: TMenuItem
      Caption = 'Selecionar Todo'
      OnClick = mnuSeleccionarTodoClick
    end
    object mnuSeleccionarResto: TMenuItem
      Caption = 'Seleccionar los Restantes'
      OnClick = mnuSeleccionarRestoClick
    end
  end
  object dsAdicionarResumen: TDataSource
    DataSet = sdqAdicionarResumen
    Left = 241
    Top = 333
  end
  object sdqAdicionarResumen: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      'SELECT   np_periodo, np_totalempleados, np_totalmasasalarial,'
      
        '         np_fechapresentacion, np_textonota, np_fechabaja, np_id' +
        ','
      
        '         np_idtipoformulario, np_observacion, emi.notas.get_esta' +
        'doformulario(np_idestadoformulario) Estado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') EstadoSim,'
      '         emi.notas.get_observacionformulario(np_id) obs,'
      
        '         np_idestadoformulario, np_idestadoformulariosim, np_fec' +
        'habaja, np_ilegible, NP_ACEPTACION,  NP_TEXTOOBSNOTA'
      '    FROM emi.inp_notacontratoperiodo'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 87'
      '     AND np_formulariomixto = '#39'N'#39
      'ORDER BY np_periodo'
      ''
      '')
    Left = 269
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object StringField21: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object FloatField9: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object FloatField10: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object DateTimeField7: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object DateTimeField8: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object FloatField11: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object FloatField12: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object StringField23: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object StringField24: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object StringField25: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object StringField26: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object FloatField13: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object FloatField14: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object DateTimeField9: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object StringField27: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object StringField28: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object StringField29: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqAdicionarResumenNP_TEXTONOTA: TStringField
      FieldName = 'NP_TEXTONOTA'
      Size = 4000
    end
    object sdqAdicionarResumenNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
      BlobType = ftOraBlob
    end
  end
  object sdqAdicionarDetalle: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_idtipoformulario, tf_descripcion, np_periodo, np_fec' +
        'habaja, np_id, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') estadosim, emi.notas.get_observacionformulario(np_id) obs,'
      
        '         np_idestadoformulario, np_idestadoformulariosim, emi.no' +
        'tas.get_notarelacionada(np_idnotaperiodorelacionada) nota,'
      
        '         np_fechabaja, np_ilegible, np_fechainscripcionempl, np_' +
        'aceptacion, at_fechapresentacion np_fechapresentacion,'
      
        '         np_totalempleados, np_totalmasasalarial, emi.notas.get_' +
        'estadoformulario(np_idestadoformulario) estado,'
      '         (SELECT np_textoobsnota'
      '            FROM emi.inp_notacontratoperiodo inp2'
      '           WHERE inp2.np_id = inp.np_id) np_textoobsnota'
      
        '    FROM emi.inp_notacontratoperiodo inp, emi.itf_tipoformulario' +
        ', emi.iat_adicionaltrabajador'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario IN(88, 90)'
      '     AND np_formulariomixto = '#39'N'#39
      '     AND tf_id = np_idtipoformulario'
      '     AND at_idnotacontratoperiodo = np_id'
      
        'GROUP BY np_idtipoformulario, tf_descripcion, np_periodo, np_fec' +
        'habaja, np_id, np_observacion,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        '), emi.notas.get_observacionformulario(np_id),'
      
        '         np_idestadoformulario, np_idestadoformulariosim, emi.no' +
        'tas.get_notarelacionada(np_idnotaperiodorelacionada),'
      
        '         np_fechabaja, np_ilegible, np_fechainscripcionempl, np_' +
        'aceptacion, at_fechapresentacion, np_totalempleados,'
      
        '         np_totalmasasalarial, emi.notas.get_estadoformulario(np' +
        '_idestadoformulario)'
      'ORDER BY np_idtipoformulario, np_periodo')
    Left = 325
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idNota'
        ParamType = ptInput
      end>
    object StringField38: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqAdicionarDetalleNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqAdicionarDetalleTF_DESCRIPCION: TStringField
      FieldName = 'TF_DESCRIPCION'
      Required = True
      Size = 250
    end
    object sdqAdicionarDetalleNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqAdicionarDetalleNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqAdicionarDetalleNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqAdicionarDetalleNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqAdicionarDetalleESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqAdicionarDetalleOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqAdicionarDetalleNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqAdicionarDetalleNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqAdicionarDetalleNOTA: TStringField
      FieldName = 'NOTA'
      Size = 4000
    end
    object sdqAdicionarDetalleNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqAdicionarDetalleNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqAdicionarDetalleNP_FECHAINSCRIPCIONEMPL: TDateTimeField
      FieldName = 'NP_FECHAINSCRIPCIONEMPL'
    end
    object sdqAdicionarDetalleNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqAdicionarDetalleNP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
      Required = True
    end
    object sdqAdicionarDetalleNP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqAdicionarDetalleNP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqAdicionarDetalleESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqAdicionarDetalleNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
      BlobType = ftOraBlob
    end
  end
  object dsAdicionarDetalle: TDataSource
    DataSet = sdqAdicionarDetalle
    Left = 297
    Top = 333
  end
  object dsFormWeb: TDataSource
    DataSet = sdqFormWeb
    Left = 73
    Top = 361
  end
  object sdqFormWeb: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT   np_periodo, np_totalempleados, np_totalmasasalarial, np' +
        '_fechapresentacion, np_textonota, np_fechabaja, np_id,'
      
        '         np_idtipoformulario, np_observacion, emi.notas.get_esta' +
        'doformulario(np_idestadoformulario) estado,'
      
        '         emi.notas.get_estadoformulario(np_idestadoformulariosim' +
        ') estadosim,'
      
        '         DECODE(np_idestadoformulario, 3, emi.notas.get_observac' +
        'ionformulario(np_id), NULL) obs, np_idestadoformulario,'
      
        '         np_idestadoformulariosim, np_fechabaja, np_ilegible, np' +
        '_aceptacion, np_textoobsnota, np_totalmasasintopear'
      '    FROM emi.inp_notacontratoperiodo'
      '   WHERE np_idnota = :idnota'
      '     AND np_idtipoformulario = 91'
      '     AND np_formulariomixto = '#39'N'#39
      'ORDER BY np_periodo')
    Left = 101
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idNota'
        ParamType = ptInput
      end>
    object StringField22: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormWebNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormWebNP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqFormWebNP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqFormWebNP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqFormWebNP_TEXTONOTA: TStringField
      FieldName = 'NP_TEXTONOTA'
      Size = 4000
    end
    object sdqFormWebNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormWebNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormWebNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormWebNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormWebESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormWebESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormWebOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormWebNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormWebNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormWebNP_FECHABAJA_1: TDateTimeField
      FieldName = 'NP_FECHABAJA_1'
    end
    object sdqFormWebNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormWebNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormWebNP_TEXTOOBSNOTA: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA'
      BlobType = ftOraBlob
      Size = 4
    end
    object sdqFormWebNP_TOTALMASASINTOPEAR: TFloatField
      FieldName = 'NP_TOTALMASASINTOPEAR'
    end
  end
  object sdqFormSitFacturacion: TSDQuery
    DatabaseName = 'dbprincipal'
    Options = []
    AfterScroll = sdqFormAfterScroll
    OnCalcFields = CamposCalculados
    SQL.Strings = (
      
        'SELECT INP.*, emi.notas.get_estadoformulario(np_idestadoformular' +
        'io) Estado,'
      
        'emi.notas.get_estadoformulario(np_idestadoformulariosim) EstadoS' +
        'im,'
      'emi.notas.get_observacionformulario(np_id) obs,'
      'tn_descripcion TipoNomina'
      'FROM EMI.INP_NOTACONTRATOPERIODO INP, EMI.ITN_TIPONOMINA'
      'WHERE NP_IDNOTA = :idNota'
      'AND NP_IDTIPOFORMULARIO = 92'
      'AND NP_FORMULARIOMIXTO = '#39'N'#39
      'AND NP_IDTIPONOMINA = TN_ID(+)'
      'ORDER BY NP_PERIODO')
    Left = 157
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idNota'
        ParamType = ptInput
      end>
    object StringField30: TStringField
      FieldKind = fkCalculated
      FieldName = 'CHECK_ESTADO'
      Size = 1
      Calculated = True
    end
    object sdqFormSitFacturacionNP_ID: TFloatField
      FieldName = 'NP_ID'
      Required = True
    end
    object sdqFormSitFacturacionNP_IDNOTA: TFloatField
      FieldName = 'NP_IDNOTA'
      Required = True
    end
    object sdqFormSitFacturacionNP_PERIODO: TStringField
      FieldName = 'NP_PERIODO'
      Size = 6
    end
    object sdqFormSitFacturacionNP_USUALTA: TStringField
      FieldName = 'NP_USUALTA'
      Required = True
    end
    object sdqFormSitFacturacionNP_FECHAALTA: TDateTimeField
      FieldName = 'NP_FECHAALTA'
      Required = True
    end
    object sdqFormSitFacturacionNP_USUMODIF: TStringField
      FieldName = 'NP_USUMODIF'
    end
    object sdqFormSitFacturacionNP_FECHAMODIF: TDateTimeField
      FieldName = 'NP_FECHAMODIF'
    end
    object sdqFormSitFacturacionNP_USUBAJA: TStringField
      FieldName = 'NP_USUBAJA'
    end
    object sdqFormSitFacturacionNP_FECHABAJA: TDateTimeField
      FieldName = 'NP_FECHABAJA'
    end
    object sdqFormSitFacturacionNP_IDTIPOFORMULARIO: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIO'
    end
    object sdqFormSitFacturacionNP_IDDDJJ: TFloatField
      FieldName = 'NP_IDDDJJ'
    end
    object sdqFormSitFacturacionNP_TEXTONOTA: TStringField
      FieldName = 'NP_TEXTONOTA'
      Size = 4000
    end
    object sdqFormSitFacturacionNP_IDSOLICITUDAUTORIZACION: TFloatField
      FieldName = 'NP_IDSOLICITUDAUTORIZACION'
    end
    object sdqFormSitFacturacionNP_CODIGORECTIFICATIVA: TStringField
      FieldName = 'NP_CODIGORECTIFICATIVA'
      Size = 2
    end
    object sdqFormSitFacturacionNP_NUMEROVERIFICADOR: TStringField
      FieldName = 'NP_NUMEROVERIFICADOR'
      Size = 6
    end
    object sdqFormSitFacturacionNP_TOTALEMPLEADOS: TFloatField
      FieldName = 'NP_TOTALEMPLEADOS'
    end
    object sdqFormSitFacturacionNP_TOTALMASASALARIAL: TFloatField
      FieldName = 'NP_TOTALMASASALARIAL'
    end
    object sdqFormSitFacturacionNP_SINEMPLEADOS: TStringField
      FieldName = 'NP_SINEMPLEADOS'
      Size = 1
    end
    object sdqFormSitFacturacionNP_CONTICKET: TStringField
      FieldName = 'NP_CONTICKET'
      Size = 1
    end
    object sdqFormSitFacturacionNP_NUMEROVERIFICADOR_2: TStringField
      FieldName = 'NP_NUMEROVERIFICADOR_2'
      Size = 6
    end
    object sdqFormSitFacturacionNP_FECHAPRESENTACION: TDateTimeField
      FieldName = 'NP_FECHAPRESENTACION'
    end
    object sdqFormSitFacturacionNP_IDINSCRIPCION: TFloatField
      FieldName = 'NP_IDINSCRIPCION'
    end
    object sdqFormSitFacturacionNP_TOTALHOJAS: TFloatField
      FieldName = 'NP_TOTALHOJAS'
    end
    object sdqFormSitFacturacionNP_CONRESUMEN: TStringField
      FieldName = 'NP_CONRESUMEN'
      Size = 1
    end
    object sdqFormSitFacturacionNP_ENMIENDA: TStringField
      FieldName = 'NP_ENMIENDA'
      Size = 1
    end
    object sdqFormSitFacturacionNP_EMPLEADOSCONALTA: TFloatField
      FieldName = 'NP_EMPLEADOSCONALTA'
    end
    object sdqFormSitFacturacionNP_EMPLEADOSCONBAJA: TFloatField
      FieldName = 'NP_EMPLEADOSCONBAJA'
    end
    object sdqFormSitFacturacionNP_FORMULARIOMIXTO: TStringField
      FieldName = 'NP_FORMULARIOMIXTO'
      Required = True
      Size = 1
    end
    object sdqFormSitFacturacionNP_OBSERVACION: TStringField
      FieldName = 'NP_OBSERVACION'
      Size = 4000
    end
    object sdqFormSitFacturacionNP_IDESTADOFORMULARIO: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIO'
    end
    object sdqFormSitFacturacionNP_IDESTADOFORMULARIOSIM: TFloatField
      FieldName = 'NP_IDESTADOFORMULARIOSIM'
    end
    object sdqFormSitFacturacionNP_IDNOTAPERIODORELACIONADA: TFloatField
      FieldName = 'NP_IDNOTAPERIODORELACIONADA'
    end
    object sdqFormSitFacturacionNP_TIPORELACION: TStringField
      FieldName = 'NP_TIPORELACION'
      Size = 1
    end
    object sdqFormSitFacturacionNP_TIPOFORMULARIOPRESENTADO: TFloatField
      FieldName = 'NP_TIPOFORMULARIOPRESENTADO'
    end
    object sdqFormSitFacturacionNP_FECHAINSCRIPCIONEMPL: TDateTimeField
      FieldName = 'NP_FECHAINSCRIPCIONEMPL'
    end
    object sdqFormSitFacturacionNP_ESTADOHISTORICO: TStringField
      FieldName = 'NP_ESTADOHISTORICO'
      Size = 1
    end
    object sdqFormSitFacturacionNP_DERIVADOHISTORICO: TStringField
      FieldName = 'NP_DERIVADOHISTORICO'
    end
    object sdqFormSitFacturacionNP_TEXTOOBSNOTA_OLD: TBlobField
      FieldName = 'NP_TEXTOOBSNOTA_OLD'
      BlobType = ftOraBlob
      Size = 4
    end
    object sdqFormSitFacturacionNP_ILEGIBLE: TStringField
      FieldName = 'NP_ILEGIBLE'
      Required = True
      Size = 1
    end
    object sdqFormSitFacturacionNP_FECHABAJACONTRATO: TDateTimeField
      FieldName = 'NP_FECHABAJACONTRATO'
    end
    object sdqFormSitFacturacionNP_ACEPTACION: TStringField
      FieldName = 'NP_ACEPTACION'
      Size = 1
    end
    object sdqFormSitFacturacionNP_IDTIPOFORMULARIOHIST: TFloatField
      FieldName = 'NP_IDTIPOFORMULARIOHIST'
    end
    object sdqFormSitFacturacionNP_ERRORV28: TStringField
      FieldName = 'NP_ERRORV28'
      Size = 1
    end
    object sdqFormSitFacturacionNP_IDTIPONOMINA: TFloatField
      FieldName = 'NP_IDTIPONOMINA'
    end
    object sdqFormSitFacturacionNP_IDDETALLESUBLOTEGESTION: TFloatField
      FieldName = 'NP_IDDETALLESUBLOTEGESTION'
    end
    object sdqFormSitFacturacionNP_TOTALMASASINTOPEAR: TFloatField
      FieldName = 'NP_TOTALMASASINTOPEAR'
    end
    object sdqFormSitFacturacionNP_TEXTOOBSNOTA: TMemoField
      FieldName = 'NP_TEXTOOBSNOTA'
      BlobType = ftOraClob
      Size = 4
    end
    object sdqFormSitFacturacionESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 4000
    end
    object sdqFormSitFacturacionESTADOSIM: TStringField
      FieldName = 'ESTADOSIM'
      Size = 4000
    end
    object sdqFormSitFacturacionOBS: TStringField
      FieldName = 'OBS'
      Size = 4000
    end
    object sdqFormSitFacturacionTIPONOMINA: TStringField
      FieldName = 'TIPONOMINA'
      Size = 150
    end
  end
  object dsFormSitFacturacion: TDataSource
    DataSet = sdqFormSitFacturacion
    Left = 129
    Top = 361
  end
end
