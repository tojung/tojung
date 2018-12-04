class Page
  controller: () =>
    $('meta[name=psj]').attr('controller')
# $('body').data('controller')
  action: () =>
    $('meta[name=psj]').attr('action')
# $('body').data('action')

@page = new Page