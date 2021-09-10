import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.comment_text}</p>`;
    const messages = document.getElementById('comments');
    const newMessage = document.getElementById('comment_txt');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
