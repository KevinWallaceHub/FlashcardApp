<template>
  <div>
      
     <div class="session">
      <study-session/>
      <!-- <session-test/> -->
      </div>
  </div>
</template>

<script>
import StudySession from "@/components/StudySession.vue"
// import SessionTest from '@/components/SessionTest.vue'
export default {
    components:{
        StudySession,
        // SessionTest
    }

}
</script>

<style>
.session{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    
}
</style>