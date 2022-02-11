## Marjaro/Arch环境下PKGBUILD文件的云构建工具

- 将含`PKGBUILD`文件和其他必需文件的构建文件夹放到仓库目录内
- 将需要构建的
- 将需要构建的AUR软件包添加到`./.github/workflows/build.yml`--`buildAUR`中的`repos`中（用","分隔）
- 将需要构建的AUR软件包添加到`./.github/workflows/build.yml`--`buildNonAUR`中的`repos`中（用","分隔）
- 提交后即可自动构建
