class Tag
  @make: (tagName, attributes, text...) ->
    t = new Tag
    t.name = tagName
    t.attributes = attributes
    t.text = ''
    t.text = text.join('')
    t

  openTag: ->
    attributeStrings = []
    close = null
    unless @text
     close = ' />'
    else
     close = '>'

    attributeStrings.push("#{key}=\"#{attribute}\"") for key, attribute of @attributes when key != 'text'
    attributeString = if attributeStrings.length > 0 then ' ' + attributeStrings.join(' ') else ''

    "<#{@name}#{attributeString}#{close}"

  closeTag: (name) ->
    "</#{@name}>"

  tag: ->
    parts = [@openTag()]
    parts.push @text
    parts.push @closeTag() if @text.length > 0
    parts.join('')
  toString: ->
    @tag()

@HtmlHelpers =
  linkTo: (name, href, options = {}) ->
    options['href'] ||= href
    Tag.make('a', options, name).toString()

  textFieldTag: (name, value = "", options = {}) ->
    options['type']   = 'text'
    options['name']   = name
    options['value']  = value
    Tag.make('input', options, null).toString()

  passwordFieldTag: (name, value = "", options = {}) ->
    options['type']   = 'password'
    options['name']   = name
    options['value']  = value
    Tag.make('input', options, null).toString()

  textArea: (name, options = {}) ->
    options['name'] = name
    Tag.make('textarea', options).toString()

  fileFieldTag: (name, options = {}) ->
    options['name'] = name
    options['type'] = 'file'
    Tag.make('input', options).toString()

  select: (name, collection = [], options = {}) ->
    options['name'] = name
    selectBody = []
    selectBody.push Tag.make('option', {}, null) if options.include_blank?
    for opt in collection
      if opt instanceof Array
        body = opt[0]
        value = opt[1]
      else
        body  = opt
        value = opt
      selectOptions = {}
      selectOptions['value'] = value
      selectOptions['selected'] = 'selected' if options['selected'] && options['selected'].toString() == value.toString()
      selectBody.push Tag.make('option', selectOptions, body)
    tagOptions = _.clone(options)
    _.map ['selected', 'collection', 'as'], (key) -> delete tagOptions[key]
    Tag.make('select', tagOptions, selectBody.join('')).toString()

  checkBoxTag: (name, value = 1, checked = false, options = {}) ->
    options['type']   = 'checkbox'
    options['name']   = name
    options['id']     ||= name
    options['value']  = value
    if checked
      options['checked'] = 'checked'
    Tag.make('input', options, null).toString()

  labelTag: (name, content = null, options = {}) ->
    options['for'] = name
    Tag.make('label', options, content).toString()

  submitTag: (value = "", options = {}) ->
    options['type']   = 'submit'
    options['value']  = value
    Tag.make('input', options, null).toString()

  FormBuilder: class FormBuilder
    constructor: (model) ->
      @model = model
      self = this
      _.map ['string', 'select', 'checkbox', 'text', 'file', 'password'], (key) ->
        self[key] = (name, options = {}) ->
          options['as'] = key
          self['input'](name, options)

    errors: (method) =>
      if @model.get('errors') && @model.get('errors')[method]
        Tag.make('div', 'class': 'errors', (@model.get('errors')[method].join(', ')))
      else
       ""

    input: (name, options = {}) =>
      method = name.replace(/\]/, '').replace(/\[/, '.')
      label = HtmlHelpers.labelTag(name, options?.label || _.humanize(name))
      input = switch options['as']
        when 'select'
          options['selected'] ||= @model.get(method)
          HtmlHelpers.select(name, options.collection || [], options)
        when 'checkbox'
          HtmlHelpers.checkBoxTag(name, 1, @model.get(method) || false, options)
        when 'text'
          options['value'] ||= @model.get(method) || ''
          HtmlHelpers.textArea(name, options)
        when 'file'
          HtmlHelpers.fileFieldTag(name, options)
        when 'password'
          HtmlHelpers.passwordFieldTag(name, "", options)
        else
          value = options['value'] || @model.get(method) || ''
          HtmlHelpers.textFieldTag(name, value, options)

      Tag.make('div', 'class': 'input', (label + input + @errors(method))).toString()

    button: (value = null, options = {}) =>
      value ||= if @model.isNew() then 'Create' else 'Update'
      HtmlHelpers.submitTag(value, options)

HAML.globals = -> HtmlHelpers