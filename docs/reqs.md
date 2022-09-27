# Thu thập & Phân tích yêu cầu
**Yêu cầu: Thiết kế một cơ sở dữ liệu cho hệ thống quản lý của một Hệ thống các trung tâm ngoại ngữ**
## Xác định đối tượng và thuộc tính cần lưu trữ & Mối quan hệ
- Hệ thống các trung tâm sẽ bao gồm nhiều **Trung tâm** ```center```, mỗi **Trung tâm** sẽ gồm các thuộc tính như:
    - Mã trung tâm (```center_id```)
    - Tên trung tâm (```name```)    
    - Địa chỉ (```address```)
    - Số điện thoại (```phone```); có thể có nhiều số điện thoại (multi-valued)

- Mỗi Trung tâm sẽ chứa nhiều **Người** ```person```, mỗi Người có những thuộc tính như:
    - Số CMND/CCCD (```id_card```)
    - Họ và tên (```name```)
    - Ngày sinh (```birthday```)
    - Giới tính (```gender```)
    - Địa chỉ (```address```)
    - Số điện thoại (```phone```); có thể có nhiều số điện thoại (multi-valued)
    - Email (```email```); có thể có nhiều email (multi-valued)

- **Người** được phân loại dựa theo chức vụ, mỗi chức vụ sẽ có một tập các thuộc tính riêng, ví dụ:

    - **Giáo viên** ```teacher```, mỗi **Giáo viên** sẽ gồm các thuộc tính như:
        - Mã giáo viên (```teacher_id```)
        - Chuyên ngành (```major```)
        - Mức lương (```salary```)
        - Mã trung tâm (```center_id```); Giáo viên có thể làm ở nhiều Trung tâm (multi-valued)
    
    - **Nhân viên** ```staff```, mỗi **Nhân viên** sẽ gồm các thuộc tính như:
        - Mã nhân viên (```staff_id```)
        - Chức vụ (```position```)
        - Mức lương (```salary```)
        - Mã trung tâm (```center_id```); Nhân viên có thể làm ở nhiều Trung tâm (multi-valued)
    
    - **Quản trị viên** ```admin```, mỗi ```admin``` sẽ gồm các thuộc tính như:
    - Mã quản trị viên (```admin_id```)
    - Tên đăng nhập (```username```)
    - Mật khẩu (```password```)
    - Mã trung tâm (```center_id```); một **Quản trị viên** có thể quản lý nhiều **Trung tâm** (multi-valued)

    - **Học viên** ```student```, mỗi **Học viên** sẽ gồm các thuộc tính như:
        - Mã học viên (```student_id```)
        - Mã trung tâm (```center_id```)
        - Mã khóa học (```course_id```); Học viên có thể học nhiều Khóa học (multi-valued)

    - **Phụ huynh** ```parent``` của các Học viên, mỗi **Phụ huynh** sẽ gồm các thuộc tính như:
        - Mã phụ huynh (```parent_id```)
        - Mã học viên của con cái (```student_id```); một **Phụ huynh** có thể có nhiều **Học viên** (multi-valued)

- Mỗi Trung tâm sẽ có nhiều **Khóa học** ```course```, mỗi ```course``` sẽ gồm các thuộc tính như:
    - Mã khóa học (```course_id```)
    - Tên khóa học (```name```)
    - Mô tả (```description```)
    - Ngày bắt đầu (```start_date```)
    - Ngày kết thúc (```end_date```)
    - Mã trung tâm (```center_id```); một **Khóa học** có thể được tổ chức ở nhiều **Trung tâm** (multi-valued)
    - Mã giáo viên (```teacher_id```); một **Giáo viên** có thể dạy nhiều **Khóa học** (multi-valued)

    - Mỗi Khóa học sẽ có nhiều **Lớp học** ```class```, mỗi ```class``` sẽ gồm các thuộc tính như:
        - Mã lớp học (```class_id```)
        - Tên lớp học (```name```)
        - Mã trung tâm (```center_id```)
        - Mã khóa học (```course_id```)
        - Mã phòng học (```room_id```)
        - Mã giáo viên (```teacher_id```)
        - Mã học viên (```student_id```); một **Lớp học** có thể có nhiều **Học viên** (multi-valued)

- Mỗi Trung tâm sẽ có nhiều **Phòng học** ```room```, mỗi ```room``` sẽ gồm các thuộc tính như:
    - Mã phòng học (```room_id```)
    - Tên phòng học (```name```)
    - Mã trung tâm (```center_id```)
    - Mã lớp học (```class_id```); một **Phòng học** có thể có nhiều **Lớp học** (multi-valued)

- Hệ thống cần quản lý các **Chi phí** phát sinh (sách vở, tài liệu, học phí, etc.) của Học viên tại Trung tâm, mỗi chi phí sẽ gồm các thuộc tính như:
    - Mã chi phí (```expense_id```)
    - Mã trung tâm (```center_id```)
    - Mã khóa học (```course_id```)
    - Mã học viên (```student_id```)
    - Ngày hết hạn (```due_date```)
    - Ngày thanh toán (```payment_date```)
    - Số tiền (```amount```)
    - Mô tả (```description```)


## Xác định các nghiệp vụ chính

