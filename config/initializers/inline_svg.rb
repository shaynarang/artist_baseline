InlineSvg.configure do |config|
  config.asset_file = InlineSvg::CachedAssetFile.new(
    paths: [
      "./public/uploads"
    ],
    filters: /\.svg/
  )
end