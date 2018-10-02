const path = require('path');
const webpack = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');
const Clean = require('clean-webpack-plugin');
const autoprefixer = require('autoprefixer');

const devMode = process.env.NODE_ENV !== 'production';

module.exports = {
  entry: ['babel-polyfill', './source/javascripts/main.js'],

  resolve: {
    modules: [
      path.join(__dirname, 'source/javascripts'),
      path.join(__dirname, 'source/stylesheets'),
      path.join(__dirname, 'node_modules'),
    ],
    extensions: ['.js', '.sass'],
  },

  output: {
    path: path.join(__dirname, '.tmp/dist'),
    filename: 'source/javascripts/[name].bundle.js',
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
      },
      {
        test: /\.sass$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
          },
          'css-loader',
          {
            loader: 'postcss-loader',
            options: {
              plugins() {
                return [autoprefixer];
              },
            },
          },
          'sass-loader',
        ],
      },
    ],
  },

  plugins: [
    new ManifestPlugin({
      fileName: 'rev-manifest.json'
    }),
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(process.env.NODE_ENV),
      },
    }),
    new Clean(['.tmp']),
    new MiniCssExtractPlugin({
      filename: devMode ? 'stylesheets/[name].css' : `stylesheets/[name].[hash].css`,
      chunkFilename: devMode ? 'stylesheets/[id].css' : 'stylesheets/[id].[hash].css',
    }),
  ],
};
