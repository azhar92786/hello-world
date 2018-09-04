$('#comment-content').html("<%= j render 'comment_modal', post: @comment %>");
$('#comment-modal').modal('show');