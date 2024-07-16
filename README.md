
### Mô tả đề tài đồ án ###
Ứng dụng được xây dựng hoàn thiện nhằm giúp mọi người có thể tiếp cận được công ty mà mình mong muốn làm việc một cách nhanh nhất. Thông qua ứng dụng, ứng viên có thể tìm kiếm được các công ty phù hợp với ngành nghề mình mong muốn hoặc đáp ứng được các nhu cầu của bản thân về địa điểm, môi trường làm việc. Song song với điều đó, phía công ty cũng có thêm một nền tảng mới để tiếp cận dễ dàng hơn với các ứng viên, không cần mất quá nhiều chi phí và thời gian cho việc quảng cáo. Nhờ thế, giữa công ty và ứng viên dễ dàng trao đổi, nắm bắt thông tin của nhau và tạo lịch hẹn để hai bên gặp gỡ, trao đổi và phỏng vấn. Việc tạo CV sẽ không còn khó khăn nữa đối với những người đi tìm việc làm vì ứng dụng sẽ hỗ trợ tạo giúp họ. Ngoài ra ứng dụng còn hỗ trợ tìm kiếm các công việc làm tại nhà chứ không chỉ có các công việc phải làm tại công ty, hỗ trợ được phần nào việc di chuyển khó khăn của nhân viên.

### Cách thức hoạt động của hệ thống ###
-	Ứng dụng giúp người lao động tìm được công ty phù hợp với nhu cầu của mình (về vị trí công việc mong muốn, số lượng nhân viên cần tuyển cho vị trí đó > 0). Sau khi tìm được công ty phù hợp, ứng viên sẽ đăng ký phỏng vấn theo các khung giờ mà công ty đề ra (sẽ được hiển thị). Sau khi tiếp nhận đơn đăng ký phỏng vấn, hệ thống sẽ gửi phiếu xác nhận tham gia phỏng vấn (gồm thời gian, địa điểm, thông tin nhân viên phỏng vấn…) đến người đăng ký.
-	Hệ thống có thêm chức năng lọc ra các công ty mà ứng viên đủ yêu cầu đáp ứng để tránh mất thời gian trong các công ty mà mình không đủ yêu cầu.
-	Đối với công ty, công ty sẽ đặt ra mỗi ngày sẽ phỏng vấn bao nhiêu người để kiểm soát số lượng người đăng ký tham gia phỏng vấn. 
-	Khi hoàn thành buổi phỏng vấn, nhân viên phỏng vấn sẽ chọn mục hoàn thành phỏng vấn. Sau 3 - 5 ngày, phía công ty sẽ quyết định có nhận ứng viên vào làm hay không. Nếu có, sẽ gửi biểu mẫu thông báo đến ứng viên. Đồng thời cập nhật lại số lượng nhân viên mà công ty cần.
-	Những ứng viên đã hoàn thành phỏng vấn có thể đánh giá cho buổi phỏng vấn của công ty. Khi tìm kiếm công việc, những công ty có lượt đánh giá cao sẽ hiện lên đầu (hiển thị theo độ uy tín giảm dần).
-	Tại một thời điểm, ứng viên không thể đăng ký phỏng vấn tại nhiều công ty.
-	Đối với ứng viên cũng sẽ có thuộc tính độ uy tín. Khi đến ngày phỏng vấn mà không tham gia thì sẽ bị trừ uy tín. Nếu điểm uy tín thấp thì sẽ bị hạn chế đăng ký (ví dụ nếu điểm uy tín nhỏ hơn 3 thì ứng viên chỉ có thể đăng ký tối đa 3 lịch phỏng vấn). Ngoài ra, người đăng ký chỉ được hủy lịch phỏng vấn trễ nhất trước một ngày để hệ thống cập nhật lại và nhường cơ hội cho các ứng viên khác đăng ký.

### Tóm tắt chức năng ###
- Công ty
  + Quản lý thông tin công ty
  + Quản lý các phòng ban
  + Quản lý vị trí công việc
  + Đánh giá ứng viên
  + Xác nhận ứng viên vào làm
  + Thống kê số lượng ứng viên đã hoàn thành phỏng vấn
- Nhà tuyển dụng
  + Quản lý thông tin nhà tuyển dụng
  + Quản lý lịch phỏng vấn
  + Xác nhận trạng thái tham gia phỏng vấn cho ứng viên
- Ứng viên
  + Quản lý thông tin ứng viên
  + Quản lý CV 
  + Tra cứu lịch phỏng vấn
  + Đăng ký phỏng vấn
  + Đánh giá công ty

### Quy trình nghiệp vụ ###
1. Quy trình cập nhật thông tin công ty và số lượng nhân lực mà công ty cần cho từng vị trí:
- Chủ công ty đăng nhập vào hệ thống để cập nhật, chỉnh sửa thông tin về công ty của mình.
- Đối với từng vị trí việc làm, công ty cập nhật, chỉnh sửa các mô tả, yêu cầu cho vị trí đó và cập nhật, chỉnh sửa số lượng nhân viên cần tuyển.
2. Quy trình cập nhật thông tin nhà tuyển dụng, tạo lịch phỏng vấn và cập nhật trạng thái đã hoàn thành phỏng vấn cho ứng viên:
- Nhà tuyển dụng đăng nhập vào hệ thống để cập nhật, chỉnh sửa thông tin liên lạc của mình.
- Nhà tuyển dụng có thể tạo lịch phỏng vấn cho từng vị trí của công ty và gia hạn số lượng người đăng ký tham gia trong một buổi phỏng vấn.
- Sau khi kết thúc buổi phỏng vấn, nhà tuyển dụng sẽ cập nhật trạng thái hoàn thành phỏng vấn cho những người đã tham gia phỏng vấn. Với những người đăng ký phỏng vấn mà không được nhà tuyển dụng xác nhận hoàn thành phỏng vấn (do không tham gia phỏng vấn), hệ thống sẽ tự động cập nhật trạng thái là “Không tham gia” vào ngày hôm sau. Trong trường hợp có tham gia phỏng vấn mà người phỏng vấn không xác nhận, ứng viên có thể phản hồi lên hệ thống. Hệ thống sẽ gửi thông báo đến nhà tuyển dụng để xác nhận và cập nhật lại trạng thái.
3. Quy trình cập nhật hồ sơ cá nhân, tìm kiếm công việc và đăng ký phỏng vấn:
- Ứng viên đăng nhập vào hệ thống để cập nhật, chỉnh sửa thông tin, hồ sơ cá nhân.
- Người dùng có thể tìm kiếm các công việc dựa theo ngành nghề hoặc tìm kiếm các công việc được truy cập nhiều nhất. Hệ thống hỗ trợ lọc ra những công việc đúng với vị trí mà người dùng mong muốn, đồng thời sắp xếp các công ty theo độ tin cậy (do người dùng đánh giá). Người dùng có thể xem thông tin của công ty, các yêu cầu, mô tả đối với vị trí việc làm và đánh giá của những người dùng khác về công ty.
- Sau khi đã xem xét các tiêu chí phù hợp, người dùng tiến hành đăng ký phỏng vấn. Hệ thống sẽ kiểm tra người dùng có đủ các tiêu chí mà công ty đề ra (về số năm kinh nghiệm, các kỹ năng cần thiết) hay không. 
  + Nếu không, hệ thống sẽ hiển thị thông báo đến người dùng và tạm thời không cho người dùng đăng ký phỏng vấn. Sau này khi người dùng đã có đủ các tiêu chí đó thì có thể cập nhật lại hồ sơ của mình để đăng ký phỏng vấn.
  + Nếu có, hệ thống sẽ hiển thị các lịch phỏng còn hiệu lực (số lượng người đăng ký vấn chưa đặt đến tối đa) mà nhà tuyển dụng đã đặt ra. Người dùng sẽ lựa chọn một trong số những ngày đó để tham gia phỏng vấn. Khi đăng ký thành công, người dùng sẽ nhận được thông báo và biểu mẫu đăng ký thành công. Người dùng sẽ được nhận thông báo nhắc nhở tham gia phỏng vấn trước một ngày phỏng vấn. 
- Ngoài ra, người dùng có thể xem các lịch phỏng vấn mà mình đã đăng ký kèm với các thông tin liên quan đến buổi phỏng vấn đó.
- Đối với những lịch đã đăng ký, trường hợp muốn hủy, thời gian trễ nhất là 1 ngày trước khi cuộc phỏng vấn diễn ra. 
- Sau khi hoàn thành phỏng vấn và được cập nhật trạng thái hoàn thành phỏng vấn, người dùng sẽ nhận được thông báo và gợi ý việc đánh giá buổi phỏng vấn của công ty. Người dùng có thể đánh giá mức độ hài lòng trên thang đánh giá 5 sao và cũng có thể ghi lại những ý kiến, đóng góp của mình dành cho công ty.
4. Quy trình nhận ứng viên làm việc tại công ty:
- Sau các buổi phỏng vấn, các ứng viên hoàn thành buổi phỏng vấn sẽ được hệ thống thêm vào danh sách các ứng viên mà nhà tuyển dụng đã phỏng vấn ứng với từng vị trí.
- Từ 3 đến 5 ngày sau khi hoàn thành phỏng vấn, công ty và người tuyển dụng sẽ họp bàn và quyết định có nhận ứng viên vào làm hay không dựa vào danh sách những ứng viên đã tham gia phỏng vấn. Nếu ứng viên được nhận, công ty sẽ xác nhận trên hệ thống. Sau đó, hệ thống sẽ tự động cập nhật lại số lượng nhân viên cần tuyển cho từng vị trí của công ty. Đồng thời, sẽ gửi thông báo chúc mừng đến ứng viên.

