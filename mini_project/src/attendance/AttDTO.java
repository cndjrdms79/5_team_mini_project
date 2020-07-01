package attendance;

import java.io.Serializable;

public class AttDTO implements Serializable {
   private String user_id;
   private String attendance;
   
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getAttendance() {
      return attendance;
   }
   public void setAttendance(String attendance) {
      this.attendance = attendance;
   }

   @Override
   public String toString() {
      return "attDTO [user_id=" + user_id + ", attendance=" + attendance + "]";
   }
   
   
}