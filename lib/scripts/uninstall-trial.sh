#!/bin/sh

# Fleet extracts and saves package IDs.
pkg_ids=(
  "com.pixelmatorteam.pixelmator.x.automator.scale-images"
  "com.pixelmator.pixelmatorteam.PDFEngine"
  "com.pixelmatorteam.pixelmator.x.pxmspotlight"
  "com.pixelmatorteam.pixelmator.x.trial.quicklookpreviewextension"
  "com.pixelmatorteam.pixelmator.paint-selection"
  "com.pixelmator.pixelmatorteam.PSDEngine"
  "com.pixelmatorteam.PTFoundation"
  "com.pixelmatorteam.pixelmator.x.automator.auto-enhance-images"
  "com.pixelmatorteam.pixelmator.x.trial.thumbnailextension"
  "com.pixelmatorteam.pixelmator.x.trial.photos-extension"
  "com.pixelmatorteam.pixelmator.x.trial.remove-background"
  "com.pixelmatorteam.PTImageIO"
  "com.pixelmator.PXMEngine"
  "com.revenuecat.Purchases"
  "com.pixelmatorteam.pixelmator.x.automator.denoise-images"
  "com.pixelmatorteam.pixelmator.x.automator.auto-white-balance-images"
  "com.pixelmatorteam.pixelmator.x.PXMUIKit"
  "com.pixelmatorteam.pixelmator.x.automator.trim-images"
  "com.pixelmatorteam.pixelmator.x.automator.apply-effects-to-images"
  "com.pixelmatorteam.PTPhotoKit"
  "com.pixelmatorteam.pixelmator.x.PXMPhotoKitUI"
  "com.pixelmatorteam.pixelmator.x.trial.PXMPro"
  "com.pixelmatorteam.pixelmator.PXMKit"
  "com.pixelmatorteam.pixelmator.x.automator.increase-resolution-of-images"
  "com.pixelmatorteam.pixelmator.object-removal"
  "com.pixelmatorteam.pixelmator.x.automator.apply-color-adjustments-to-images"
  "com.pixelmator.pixelmatorteam.LibRaw"
  "com.pixelmatorteam.PTPaintTools"
  "com.pixelmatorteam.extended-raw-support"
  "com.pixelmator.pixelmatorteam.SVGEngine"
  "com.pixelmatorteam.pixelmator.x.automator.change-type-of-images"
)

# For each package id, get all .app folders associated with the package and remove them.
for pkg_id in "${pkg_ids[@]}"
do
  # Get volume and location of the package.
  volume=$(pkgutil --pkg-info "$pkg_id" | grep -i "volume" | awk '{if (NF>1) print $NF}')
  location=$(pkgutil --pkg-info "$pkg_id" | grep -i "location" | awk '{if (NF>1) print $NF}')
  # Check if this package id corresponds to a valid/installed package
  if [[ ! -z "$volume" ]]; then
    # Remove individual directories that end with ".app" belonging to the package.
    # Only process directories that end with ".app" to prevent Fleet from removing top level directories.
    pkgutil --only-dirs --files "$pkg_id" | grep "\.app$" | sed -e 's@^@'"$volume""$location"'/@' | tr '\n' '\0' | xargs -n 1 -0 rm -rf
    # Remove receipts
    pkgutil --forget "$pkg_id"
  else
    echo "WARNING: volume is empty for package ID $pkg_id"
  fi
done
