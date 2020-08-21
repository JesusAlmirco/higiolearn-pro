const { environment } = require('@rails/webpacker')
//Integrate bootstrap compunents
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['Popper.js', 'default']
}))
//end integrate
module.exports = environment
