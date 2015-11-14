$.rails.allowAction = (element) ->
  message = element.data('confirm')
  return true unless message
  $link = element.clone()
    .removeAttr('class')
    .removeAttr('data-confirm')
    .addClass('btn').addClass('btn-danger')
    .html("Delete")

  modal_html = """
              <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-sm">
                  <div class="modal-content">
                    <div class="modal-header">
                      <a class="close" data-dismiss="modal">×</a>
                      <h3>#{message}</h3>
                    </div>
                    <div class="modal-body">
                      <p>Note: This operation can not be undone.</p>
                    </div>
                    <div class="modal-footer">
                      <a data-dismiss="modal" class="btn btn-link">Cancel</a>
                    </div>
                  </div>
                </div>
              </div>
              """
  $modal_html = $(modal_html)
  $modal_html.find('.modal-footer').append($link)
  $modal_html.modal()
  return false