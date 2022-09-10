## Arch/Marjaro环境下PKGBUILD文件的云构建工具

1. 将含`PKGBUILD`文件和其他必需文件的构建文件夹放到仓库目录内
2. 将需要构建的对应软件包添加到`./.github/workflows/对应文件`中的`repos`的中括号内（用","分隔）
   - 若构建文件在本仓库内，添加到`buildFromLocal.yml`
   - 若构建文件在AUR上，且需要随着提交自动构建，添加到`buildFromAUR.yml`
   - 若构建文件在AUR上，且需要每周自动构建，添加到`buildFromAURWeekly.yml`
   - 若构建文件在AUR上，且需要每月自动构建，添加到`buildFromAURMonthly.yml`
3. 提交后即可自动构建
