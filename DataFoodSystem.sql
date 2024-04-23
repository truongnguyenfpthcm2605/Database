insert into GroupProduct values
(N'APPLE',NULL),
(N'SAMSUNG',NULL),
(N'OPPO',NULL),
(N'XIAOMI',NULL),
(N'SONY',NULL)

select * from GroupProduct
/*
CREATE TABLE [Product] (
  [id] int IDENTITY(1,1) PRIMARY KEY,
  [title] nvarchar(100) not null,
  [discount] float not null,
  [price] float not null,
  [ram] int not null,
  [rom] int not null,
  [pin] int not null,
  [chip] nvarchar(30)  not null,
  [camera] int not null,
  [screen] float not null,
  [createDate] datetime default getdate(),
  [updateDate] datetime null ,
  [quanityfinal] int not null,
  [quantitysold] int  not null,
  [imgproduct] nvarchar(50)  not null,
  [thumnail] nvarchar(256)  not null,
  [description] nvarchar(500)  not null,
  [isActive] bit  default 1,
  [views] bigint default 0 ,
  [idGroup] int
)
GO
*/
-- samsung

insert into product
(title,discount,price,ram,rom,pin,chip,camera,screen
,createDate,updateDate,quanityfinal,quantitysold,imgproduct,thumnail,description,isActive,views,idGroup)
values
(N'SamSung Galaxy S23 Ultra',30000000,25990000,8,512,5000,N'Snapdragon 8Gen2',12,6.7,getdate(),getdate(),950,50,N'sam1.jpg',
N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg',
N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.',
1,1000,2),
(N'SamSung Galaxy S22 Plus',25990000,20990000,12,256,6000,N'Snapdragon 8Gen1',12,6.5,getdate(),getdate(),450,50,N'sam2.jpg',
N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg',
N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.',
1,1000,2),
(N'SamSung Galaxy S21 Ultra',15990000,12990000,6,128,4000,N'Snapdragon 888',12,6.5,getdate(),getdate(),250,50,N'sam3.jpg',
N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg',
N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.',
1,1000,2),
(N'SamSung Galaxy S21 Plus',15990000,12990000,6,64,4500,N'Exynos 2100',12,6.2,getdate(),getdate(),250,50,N'sam4.jpg',
N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg',
N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.',
1,1000,2),
(N'SamSung Galaxy S20 Ultra',10990000,8990000,6,256,5500,N'Snapdragon 865',12,6.2,getdate(),getdate(),150,50,N'sam5.jpg',
N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg',
N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.',
1,1000,2),
(N'SamSung Galaxy A73 5G',9990000,7990000,6,128,6500,N'Snapdragon 778G',12,6.7,getdate(),getdate(),150,50,N'sam6.jpg',
N'samsung1.jpg-samsung21.jpg-samsung3.jpg-samsung4.jpg-samsung5.jpg',
N'Samsung Galaxy S21 FE 5G (6GB/128GB) được Samsung ra mắt với dáng dấp thời thượng, cấu hình khỏe, chụp ảnh đẹp với bộ 3 camera chất lượng, thời lượng pin đủ dùng hằng ngày và còn gì nữa? Mời bạn khám phá qua nội dung sau ngay.',
1,1000,2)

-- iphone
insert into product
(title,discount,price,ram,rom,pin,chip,camera,screen
,createDate,updateDate,quanityfinal,quantitysold,imgproduct,thumnail,description,isActive,views,idGroup)
values
(N'Iphone 14 Pro Max',35990000,30990000,6,256,6000,N'Apple A16 Bionic',12,6.5,getdate(),getdate(),900,100,N'iphone14.jpg',
N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg',
N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.',
1,1000,1),
(N'Iphone 13 Pro ',30990000,2990000,6,128,5000,N'Apple A15 Bionic',12,6.5,getdate(),getdate(),700,100,N'iphone13.jpg',
N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg',
N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.',
1,1000,1),
(N'Iphone 12 Pro Max ',25990000,23990000,6,512,4500,N'Apple A14 Bionic',12,6.7,getdate(),getdate(),400,100,N'iphone12.jpg',
N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg',
N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.',
1,1000,1),
(N'Iphone 11 Pro Max ',20990000,16990000,4,128,4000,N'Apple A13 Bionic',12,6.7,getdate(),getdate(),200,100,N'iphone11.jpg',
N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg',
N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.',
1,1000,1),
(N'Iphone Xs Max ',10990000,8990000,4,64,4000,N'Apple A12 Bionic',12,6.5,getdate(),getdate(),200,100,N'iphonexsmax.jpg',
N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg',
N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.',
1,1000,1),
(N'Iphone 8 Plus ',6990000,5990000,3,64,2900,N'Apple A11 Bionic',12,5.5,getdate(),getdate(),100,50,N'iphone8.jpg',
N'ip1.jpg-ip4.jpg-ip3.jpg-ip2.jpg-ip5.jpg',
N'iPhone 14 vàng là phiên bản màu sắc mới được Apple cập nhật vào tháng 3/2023. Điện thoại iPhone 14 vàng chanh này được hoàn thiệt mặt sau bằng kinh và cạnh viền nhôm màu vàng rực rõ. Các chi tiết khác sẽ giống những mẫu iPhone 14 phiên bản màu khác. Cụ thể, iPhone 14 vàng được trang bị màn hình OLED 6.1 inch siêu sắc nét. Hiệu năng vượt trội tới từ chipset đầu bảng - A15 Bionic.
Hệ thống camera với nhiều cải tiến mới cùng dung lượng pin 3279mAh giúp nâng cao trải nghiệm của người dùng.',
1,1000,1)

-- xiaomi
insert into product
(title,discount,price,ram,rom,pin,chip,camera,screen
,createDate,updateDate,quanityfinal,quantitysold,imgproduct,thumnail,description,isActive,views,idGroup)
values
(N' Xiaomi Redmi Note 12 ',5990000,5790000,8,128,6000,N'Snapdragon 685',64,6.5,getdate(),getdate(),900,100,N'xiaomi1.jpg',
N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg',
N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.',
1,1000,4),
(N' Xiaomi Mi 13 ',25990000,23790000,12,512,6500,N'Snapdragon 8 Gen 2',108,6.5,getdate(),getdate(),500,100,N'xiaomi2.jpg',
N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg',
N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.',
1,1000,4),
(N' Xiaomi Redmi note 11 ',6990000,6590000,6,128,5000,N'Snapdragon 765G',48,6.7,getdate(),getdate(),200,100,N'xiaomi3.jpg',
N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg',
N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.',
1,1000,4),
(N' Xiaomi Redmi K40 ',8990000,7590000,8,256,5000,N'Snapdragon 870',48,6.6,getdate(),getdate(),250,100,N'xiaomi4.jpg',
N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg',
N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.',
1,1000,4),
(N' Xiaomi Mi 12 Ultra ',19990000,17590000,8,256,5000,N'Snapdragon 8 Gen 1',200,6.5,getdate(),getdate(),50,20,N'xiaomi5.jpg',
N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg',
N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.',
1,1000,4),
(N' Xiaomi Redmi K60 ',18990000,17990000,8,256,5000,N'Snapdragon 8 Gen 2',64,6.7,getdate(),getdate(),100,30,N'xiaomi6.jpg',
N'mi.jpg-mi2.jpg-mi3.jpg-mi4.jpg-mi5.jpg',
N'Redmi Note 12 sở hữu cho mình một dáng vẻ vuông vắn đầy thời thượng, các góc bo tròn cùng mặt lưng và bộ khung vát phẳng tạo nên nên một cái nhìn hiện đại và cực kỳ trẻ trung. Hơn hết, màu sắc cũng chính là điều góp phần làm cho chiếc máy 
trở nên thu hút với 3 tone màu hiện đại là: Xám, Xanh Dương và Xanh Lá.',
1,1000,4)

-- oppo
insert into product
(title,discount,price,ram,rom,pin,chip,camera,screen
,createDate,updateDate,quanityfinal,quantitysold,imgproduct,thumnail,description,isActive,views,idGroup)
values
(N'OPPO Reno 8T',10990000,9990000,8,256,5500,N'Snapdragon 695',64,6.5,getdate(),getdate(),800,100,N'oppo1.jpg',
N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg',
N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.',
1,1000,3),
(N'OPPO Find X5 Pro 5G',19990000,17990000,12,256,5900,N'Snapdragon 8 Gen 2',190,6.8,getdate(),getdate(),600,100,N'oppo2.jpg',
N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg',
N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.',
1,1000,3),
(N'OPPO Find N2 Flip 5G',19990000,17990000,12,256,6100,N'Snapdragon 8 Gen 2',108,6.5,getdate(),getdate(),400,100,N'oppo3.jpg',
N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg',
N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.',
1,1000,3),
(N'OPPO Reno6 Pro 5G',13990000,12990000,12,512,6550,N'Snapdragon 870',108,6.6,getdate(),getdate(),200,50,N'oppo4.jpg',
N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg',
N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.',
1,1000,3),
(N'OPPO A96',6990000,5990000,6,128,6250,N'Snapdragon 680',64,6.7,getdate(),getdate(),200,50,N'oppo5.jpg',
N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg',
N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.',
1,1000,3),
(N' OPPO Reno7 Z 5G',7990000,6990000,6,128,5250,N'Snapdragon 695',108,6.55,getdate(),getdate(),400,50,N'oppo6.jpg',
N'op1.jpg-op4.jpg-op3.jpg-op2.jpg-op5.jpg',
N'Tiếp nối sự thành công rực rỡ đến từ các thế hệ trước đó thì chiếc OPPO Reno8 T 5G 256GB cuối cùng đã được giới thiệu chính thức tại Việt Nam, được định hình là dòng sản phẩm thuộc phân khúc tầm trung với camera 108 MP, 
con chip Snapdragon 695 cùng kiểu dáng thiết kế mặt lưng và màn hình bo cong hết sức nổi bật.',
1,1000,3)

-- sony
insert into product
(title,discount,price,ram,rom,pin,chip,camera,screen
,createDate,updateDate,quanityfinal,quantitysold,imgproduct,thumnail,description,isActive,views,idGroup)
values
(N'Sony Xperia 1 Mark ii',6990000,5990000,8,128,4550,N'Snapdragon 865',16,6.5,getdate(),getdate(),800,100,N'sony1.jpg',
N's1.jpg-s4.jpg-s3.jpg-s2.jpg-s5.jpg',
N'Sony Xperia 1 Mark II đã ra mắt trong một tháng nay, và những người đam mê công nghệ đã háo hức chờ đợi để nghe cách thiết bị mới này chống lại các đối thủ cạnh tranh của nó.
Là một trong những phiên bản được mong đợi nhất trong năm, Sony Xperia 1 Mark II được trang bị các tính năng làm cho nó nổi bật so với các điện thoại thông minh khác trên thị trường. 
Từ hệ thống máy ảnh ấn tượng đến màn hình 4K OLED đẹp mắt, điện thoại này có rất nhiều thứ để cung cấp.',
1,1000,5),
(N'Sony Xperia 1',3990000,3490000,6,128,3050,N'Snapdragon 855',12,6.5,getdate(),getdate(),200,80,N'sony2.jpg',
N's1.jpg-s4.jpg-s3.jpg-s2.jpg-s5.jpg',
N'Sony Xperia 1 Mark II đã ra mắt trong một tháng nay, và những người đam mê công nghệ đã háo hức chờ đợi để nghe cách thiết bị mới này chống lại các đối thủ cạnh tranh của nó.
Là một trong những phiên bản được mong đợi nhất trong năm, Sony Xperia 1 Mark II được trang bị các tính năng làm cho nó nổi bật so với các điện thoại thông minh khác trên thị trường. 
Từ hệ thống máy ảnh ấn tượng đến màn hình 4K OLED đẹp mắt, điện thoại này có rất nhiều thứ để cung cấp.',
1,1000,5),
(N'Sony Xperia 5',4990000,4490000,6,128,3350,N'Snapdragon 855',16,6.7,getdate(),getdate(),100,80,N'sony3.jpg',
N's1.jpg-s4.jpg-s3.jpg-s2.jpg-s5.jpg',
N'Sony Xperia 1 Mark II đã ra mắt trong một tháng nay, và những người đam mê công nghệ đã háo hức chờ đợi để nghe cách thiết bị mới này chống lại các đối thủ cạnh tranh của nó.
Là một trong những phiên bản được mong đợi nhất trong năm, Sony Xperia 1 Mark II được trang bị các tính năng làm cho nó nổi bật so với các điện thoại thông minh khác trên thị trường. 
Từ hệ thống máy ảnh ấn tượng đến màn hình 4K OLED đẹp mắt, điện thoại này có rất nhiều thứ để cung cấp.',
1,1000,5)

select * from product

/*
CREATE TABLE [Account] (
  [email] nvarchar(30) PRIMARY KEY,
  [password] nvarchar(100) not null,
  [fullname] nvarchar(30) not null,
  [address] nvarchar(100) not null,
  [phoneNumbers] varchar(11) not null,
  [createDate] datetime,
  [updateDate] datetime,
  [img] nvarchar(30),
  [gender] bit not null,
  [isActive] bit
)
GO
*/
insert into Account values 
(N'truongnvps24083@fpt.edu.vn',N'12345',N'Nguyễn Văn Trường',N'Vinhome Quận 9 ,TPHCM',N'0377379249',getdate(),getdate(),N'avt1',1,1)
insert into Roles values ('ADMIN',N'Quản Trị')
insert into Authorities values (N'truongnvps24083@fpt.edu.vn','ADMIN')
select * from Authorities