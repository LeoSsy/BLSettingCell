## 一、使用须知

### 项目中cell的类型以及数据的展示 依靠 BLSettingModel
### 项目中各类型cell展示的具体样式 依靠 BLSettingStyle
### 查看目前支持的显示类型和cell样式参考BLSettingConst 的枚举
### 快速构建参考BLSettingFactory
### 自定义模型对象的时候 千万切记要调用  model.type(支持的类型（参考BLSettingConst 的枚举）)  设置模型，否则无法展示正确的cell类型
### 当在设置BLSettingModel的属性和BLSettingStyle的样式的时候，请进入头文件查看 我用#pragma mark 标记说明的属性，不同的类型cell对应着不同属性,请对照着设置即可。


### 自定义参考BLSettingModel如下初始化方法

/**
快速初始化方法 此方法带默认的样式 需要额外设置cell类型 否则无法展示正确的cell类型
*/
+ (instancetype)model;
/**
快速初始化方法 此方法带默认的样式
@param cellType cell类型
*/
+ (instancetype)modelType:(BLSettingCellType)cellType;
/**
快速初始化方法 带自定义的样式，如果你不希望使用默认的样式 那么需要通过此方法来初始化模型
@param settingStyle cell样式对象
*/
+ (instancetype)modelStyle:(BLSettingStyle*)settingStyle;
/**
快速初始化方法  带自定义的样式，如果你不希望使用默认的样式 那么需要通过此方法来初始化模型
@param cellType cell类型
@param settingStyle cell样式对象
*/
+ (instancetype)modelType:(BLSettingCellType)cellType style:(BLSettingStyle*)settingStyle;








































