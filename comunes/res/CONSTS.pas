
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1995,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit Consts;

interface

resourcestring
  SOpenFileTitle = 'Abrir';
  SAssignError = 'No se puede asignar %s a %s';
  SFCreateError = 'No se puede crear el archivo %s';
  SFOpenError = 'No se puede abrir el archivo %s';
  SReadError = 'Error de flujo de lectura';
  SWriteError = 'Error de flujo de escritura';
  SMemoryStreamError = 'Sin memoria al expandir un flujo de memoria';
  SCantWriteResourceStreamError = 'No se puede escribir en un flujo de solo lectura';
  SDuplicateReference = 'WriteObject ha sido llamado dos veces en la misma instancia';
  SClassNotFound = 'No se encuentra la clase %s';
  SInvalidImage = 'Formato del flujo inválido';
  SResNotFound = 'No se encontró el recurso %s';
  SClassMismatch = 'El recurso %s es de una clase incorrecta';
  SListIndexError = 'Indice de lista fuera de rango (%d)';
  SListCapacityError = 'Capacidad de la lista fuera de rango (%d)';
  SListCountError = 'Contador de la lista fuera de rango (%d)';
  SSortedListError = 'Operación no permitida en una lista ordenada de cadenas';
  SDuplicateString = 'La lista de cadenas no acepta duplicados';
  SInvalidTabIndex = 'Indice de página fuera de rango';
  SInvalidTabPosition = 'La posición de la página no es compatible con el estilo actual de la misma';
  SInvalidTabStyle = 'El estilo de la página no es compatible con la posición actual de la misma';
  SDuplicateName = 'Ya existe un componente con el nombre ''%s''';
  SInvalidName = '''''%s'''' no es un nombre de componente válido';
  SDuplicateClass = 'Ya existe una clase con el nombre %s';
  SNoComSupport = '%s no es una clase COM registrada';
  SInvalidInteger = '''''%s'''' no es un valor entero válido';
  SLineTooLong = 'Línea demasiado larga';
  SInvalidPropertyValue = 'Valor de la propiedad inválido';
  SInvalidPropertyPath = 'Ruta de la propiedad inválida';
  SInvalidPropertyType = 'Tipo de propiedad inválido: %s';
  SInvalidPropertyElement = 'Elemento de la propiedad inválido: %s';
  SUnknownProperty = 'La propiedad no existe';
  SReadOnlyProperty = 'La porpiedad es de solo lectura';
  SPropertyException = 'Error leyendo %s%s%s: %s';
  SAncestorNotFound = 'No se encontro el ancestro para ''%s''';
  SInvalidBitmap = 'Mapa de bits no válido';
  SInvalidIcon = 'Icono no válido';
  SInvalidMetafile = 'Metafile no válido';
  SInvalidPixelFormat = 'Formato de píxel inválido';
  SBitmapEmpty = 'Mapa de bits vacío';
  SScanLine = 'Línea examinada fuera de rango';
  SChangeIconSize = 'No se puede cambiar el tamaño de un Icono';
  SOleGraphic = 'Operación inválida en un TOleGraphic';
  SUnknownExtension = 'Extensión de imagen desconocida (.%s)';
  SUnknownClipboardFormat = 'Formato del portapapeles no soportado';
  SOutOfResources = 'Sistema sin recursos';
  SNoCanvasHandle = 'El Canvas no permite dibujar';
  SInvalidImageSize = 'Tamaño de imagen inválido';
  STooManyImages = 'Demaciadas Imágenes';
  SDimsDoNotMatch = 'Las dimensiones de la imagen no concuerdan con las de la lista de imágenes';
  SInvalidImageList = 'Lista de imágenes inválida';
  SReplaceImage = 'Imposible reemplazar la Imagen';
  SImageIndexError = 'Indice de la lista de imágenes inválido';
  SImageReadFail = 'Falló la lectura de los datos del flujo de la lista de imágenes';
  SImageWriteFail = 'Falló la escritura de los datos del flujo de la lista de imágenes';
  SWindowDCError = 'Error creando el dispocitivo de contexto de la ventana';
  SClientNotSet = 'Cliente de TDrag no inicializado';
  SWindowClass = 'Error creando la clase de la ventana';
  SWindowCreate = 'Error creando la ventana';
  SCannotFocus = 'No se puede enfocar en una ventana invisible o desactivada';
  SParentRequired = 'El control ''%s'' no tiene una ventana contenedora';
  SMDIChildNotVisible = 'No se puede ocultar un formulario hijo de MDI';
  SVisibleChanged = 'No se puede cambiar la visibilidad en el OnShow o OnHide';
  SCannotShowModal = 'No se puede hacer modal una ventana visible';
  SScrollBarRange = 'Propiedad del Scrollbar fuera de rango';
  SPropertyOutOfRange = 'Propiedad %s fuera de rango';
  SMenuIndexError = 'Índice de menú fuera de rango';
  SMenuReinserted = 'Menú insertado dos veces';
  SMenuNotFound = 'El sub-menú no pertenece al menú';
  SNoTimers = 'No hay Timers disponibles';
  SNotPrinting = 'No hay impresión en curso';
  SPrinting = 'Impresión en curso';
  SPrinterIndexError = 'Índice de impresora fuera de rango';
  SInvalidPrinter = 'Impresora seleccionada no válida';
  SDeviceOnPort = '%s en %s';
  SGroupIndexTooLow = 'GroupIndex no puede ser menor que el elemento anterior (GroupIndex) del menú';
  STwoMDIForms = 'No puede tener mas de un formulario MDI por aplicación';
  SNoMDIForm = 'No se puede crear el formulario. Actualmente no hay formularios MDI activos';
  SRegisterError = 'Registración de componente inválido';
  SImageCanvasNeedsBitmap = 'Solo puede modificar la imagen si esta contiene un mapa de bits';
  SControlParentSetToSelf = 'Un control no se puede tener a si mismo como contenedor';
  SOKButton = 'Aceptar';
  SCancelButton = 'Cancelar';
  SYesButton = '&Si';
  SNoButton = '&No';
  SHelpButton = '&Ayuda';
  SCloseButton = '&Cerrar';
  SIgnoreButton = '&Ignorar';
  SRetryButton = '&Reintentar';
  SAbortButton = 'Abortar';
  SAllButton = '&Todos';

  SCannotDragForm = 'No puede arrastrar un formulario';
  SPutObjectError = 'PutObject para item indefinido';
  SCardDLLNotLoaded = 'No se puede cargar CARDS.DLL';
  SDuplicateCardId = 'Se encontró un CardId duplicado';

  SDdeErr = 'DDE ha retornado un error  ($0%x)';
  SDdeConvErr = 'Error del DDE - conversación no establecida ($0%x)';
{******************************************************************************************
  HASTA ACÁ LLEGÚE
 ******************************************************************************************} 
  SDdeMemErr = 'Error occurred when DDE ran out of memory ($0%x)';
  SDdeNoConnect = 'Unable to connect DDE conversation';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SOldTShape = 'Cannot load older version of TShape';
  SVMetafiles = 'Metafiles';
  SVEnhMetafiles = 'Enhanced Metafiles';
  SVIcons = 'Icons';
  SVBitmaps = 'Bitmaps';
  SGridTooLarge = 'Grid too large for operation';
  STooManyDeleted = 'Too many rows or columns deleted';
  SIndexOutOfRange = 'Grid index out of range';
  SFixedColTooBig = 'Fixed column count must be less than column count';
  SFixedRowTooBig = 'Fixed row count must be less than row count';
  SInvalidStringGridOp = 'Cannot insert or delete rows from grid';
  SParseError = '%s on line %d';
  SIdentifierExpected = 'Identifier expected';
  SStringExpected = 'String expected';
  SNumberExpected = 'Number expected';
  SCharExpected = '''''%s'''' expected';
  SSymbolExpected = '%s expected';
  SInvalidNumber = 'Invalid numeric value';
  SInvalidString = 'Invalid string constant';
  SInvalidProperty = 'Invalid property value';
  SInvalidBinary = 'Invalid binary value';
  SOutlineIndexError = 'Outline index not found';
  SOutlineExpandError = 'Parent must be expanded';
  SInvalidCurrentItem = 'Invalid value for current item';
  SMaskErr = 'Invalid input value';
  SMaskEditErr = 'Invalid input value.  Use escape key to abandon changes';
  SOutlineError = 'Invalid outline index';
  SOutlineBadLevel = 'Incorrect level assignment';
  SOutlineSelection = 'Invalid selection';
  SOutlineFileLoad = 'File load error';
  SOutlineLongLine = 'Line too long';
  SOutlineMaxLevels = 'Maximum outline depth exceeded';

  SMsgDlgWarning = 'Warning';
  SMsgDlgError = 'Error';
  SMsgDlgInformation = 'Information';
  SMsgDlgConfirm = 'Confirm';
  SMsgDlgYes = '&Yes';
  SMsgDlgNo = '&No';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = 'Cancel';
  SMsgDlgHelp = '&Help';
  SMsgDlgHelpNone = 'No help available';
  SMsgDlgHelpHelp = 'Help';
  SMsgDlgAbort = '&Abort';
  SMsgDlgRetry = '&Retry';
  SMsgDlgIgnore = '&Ignore';
  SMsgDlgAll = '&All';
  SMsgDlgNoToAll = 'N&o to All';
  SMsgDlgYesToAll = 'Yes to &All';

  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcSpace = 'Space';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcIns = 'Ins';
  SmkcDel = 'Del';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';

  srUnknown = '(Unknown)';
  srNone = '(None)';
  SOutOfRange = 'Value must be between %d and %d';
  SCannotCreateName = 'Cannot create a default method name for an unnamed component';

  SDateEncodeError = 'Invalid argument to date encode';
  STimeEncodeError = 'Invalid argument to time encode';
  SInvalidDate = '''''%s'''' is not a valid date';
  SInvalidTime = '''''%s'''' is not a valid time';
  SInvalidDateTime = '''''%s'''' is not a valid date and time';
  SInvalidFileName = 'Invalid file name - %s';
  SDefaultFilter = 'All files (*.*)|*.*';
  sAllFilter = 'All';
  SNoVolumeLabel = ': [ - no volume label - ]';
  SInsertLineError = 'Unable to insert a line';

  SConfirmCreateDir = 'The specified directory does not exist. Create it?';
  SSelectDirCap = 'Select Directory';
  SCannotCreateDir = 'Unable to create directory';
  SDirNameCap = 'Directory &Name:';
  SDrivesCap = 'D&rives:';
  SDirsCap = '&Directories:';
  SFilesCap = '&Files: (*.*)';
  SNetworkCap = 'Ne&twork...';

  SColorPrefix = 'Color';               //!! obsolete - delete in 5.0
  SColorTags = 'ABCDEFGHIJKLMNOP';      //!! obsolete - delete in 5.0

  SInvalidClipFmt = 'Invalid clipboard format';
  SIconToClipboard = 'Clipboard does not support Icons';
  SCannotOpenClipboard = 'Cannot open clipboard';

  SDefault = 'Default';

  SInvalidMemoSize = 'Text exceeds memo capacity';
  SCustomColors = 'Custom Colors';
  SInvalidPrinterOp = 'Operation not supported on selected printer';
  SNoDefaultPrinter = 'There is no default printer currently selected';

  SIniFileWriteError = 'Unable to write to %s';

  SBitsIndexError = 'Bits index out of range';

  SUntitled = '(Untitled)';

  SInvalidRegType = 'Invalid data type for ''%s''';
  SRegCreateFailed = 'Failed to create key %s';
  SRegSetDataFailed = 'Failed to set data for ''%s''';
  SRegGetDataFailed = 'Failed to get data for ''%s''';

  SUnknownConversion = 'Unknown RichEdit conversion file extension (.%s)';
  SDuplicateMenus = 'Menu ''%s'' is already being used by another form';

  SPictureLabel = 'Picture:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = 'Preview';

  SCannotOpenAVI = 'Cannot open AVI';

  SNotOpenErr = 'No MCI device open';
  SMPOpenFilter = 'All files (*.*)|*.*|Wave files (*.wav)|*.wav|Midi files (*.mid)|*.mid|Video for Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'Other';
  SMCIOverlay = 'Overlay';
  SMCIScanner = 'Scanner';
  SMCISequencer = 'Sequencer';
  SMCIVCR = 'VCR';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = 'Unknown error code';

  SBoldItalicFont = 'Bold Italic';
  SBoldFont = 'Bold';
  SItalicFont = 'Italic';
  SRegularFont = 'Regular';

  SPropertiesVerb = 'Properties';

  sWindowsSocketError = 'Windows socket error: %s (%d), on API ''%s''';
  sAsyncSocketError = 'Asynchronous socket error %d';
  sNoAddress = 'No address specified';
  sCannotListenOnOpen = 'Can''t listen on an open socket';
  sCannotCreateSocket = 'Can''t create new socket';
  sSocketAlreadyOpen = 'Socket already open';
  sCantChangeWhileActive = 'Can''t change value while socket is active';
  sSocketMustBeBlocking = 'Socket must be in blocking mode';
  sSocketIOError = '%s error %d, %s';
  sSocketRead = 'Read';
  sSocketWrite = 'Write';

  SServiceFailed = 'Service failed on %s: %s';
  SExecute = 'execute';
  SStart = 'start';
  SStop = 'stop';
  SPause = 'pause';
  SContinue = 'continue';
  SInterrogate = 'interrogate';
  SShutdown = 'shutdown';
  SCustomError = 'Service failed in custom message(%d): %s';
  SServiceInstallOK = 'Service installed successfully';
  SServiceInstallFailed = 'Service "%s" failed to install with error: "%s"';
  SServiceUninstallOK = 'Service uninstalled successfully';
  SServiceUninstallFailed = 'Service "%s" failed to uninstall with error: "%s"';

  SInvalidActionRegistration = 'Invalid action registration';
  SInvalidActionUnregistration = 'Invalid action unregistration';
  SInvalidActionEnumeration = 'Invalid action enumeration';
  SInvalidActionCreation = 'Invalid action creation';
  
  SDockedCtlNeedsName = 'Docked control must have a name';
  SDockTreeRemoveError = 'Error removing control from dock tree';
  SDockZoneNotFound = ' - Dock zone not found';
  SDockZoneHasNoCtl = ' - Dock zone has no control';

  SAllCommands = 'All Commands';

  SDuplicateItem = 'List does not allow duplicates ($0%x)';

  SDuplicatePropertyCategory = 'A property category called %s already exists';
  SUnknownPropertyCategory = 'Property category does not exist (%s)';

  SActionCategoryName = 'Action';
  SActionCategoryDesc = 'Action properties and/or events';
  SDataCategoryName = 'Data';
  SDataCategoryDesc = 'Data properties and/or events';
  SDatabaseCategoryName = 'Database';
  SDatabaseCategoryDesc = 'Database and Data Aware properties and/or events';
  SDragNDropCategoryName = 'Drag, Drop and Docking';
  SDragNDropCategoryDesc = 'Drag, Drop and Docking properties and/or events';
  SHelpCategoryName = 'Help and Hints';
  SHelpCategoryDesc = 'Help and Hint properties and/or events';
  SLayoutCategoryName = 'Layout';
  SLayoutCategoryDesc = 'Layout properties and/or events';
  SLegacyCategoryName = 'Legacy';
  SLegacyCategoryDesc = 'Legacy properties and/or events';
  SLinkageCategoryName = 'Linkage';
  SLinkageCategoryDesc = 'Linkage properties and/or events';
  SLocaleCategoryName = 'Locale';
  SLocaleCategoryDesc = 'Locale properties and/or events';
  SLocalizableCategoryName = 'Localizable';
  SLocalizableCategoryDesc = 'Localizable properties and/or events';
  SMiscellaneousCategoryName = 'Miscellaneous';
  SMiscellaneousCategoryDesc = 'Miscellaneous properties and/or events';
  SVisualCategoryName = 'Visual';
  SVisualCategoryDesc = 'Visual properties and/or events';
  SInputCategoryName = 'Input';
  SInputCategoryDesc = 'Input properties and/or events';

  SInvalidMask = '''%s'' is an invalid mask at (%d)';
  SInvalidFilter = 'Property filters may only be name, class or type based (%d:%d)';
  SInvalidCategory = 'Categories must define their own name and description';

  sOperationNotAllowed = 'Operation not allowed while dispatching application events';

implementation

end.
