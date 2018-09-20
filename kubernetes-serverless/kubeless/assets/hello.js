module.exports = {
  greeting: function (event, context) {
    return 'Hello world, from a Kubeless function!\n' + event.data;
  }
}