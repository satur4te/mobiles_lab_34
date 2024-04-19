import android.content.Context
import android.provider.ContactsContract.Data
import android.widget.Toast
import retrofit.*

class ApiCall {
    fun getjokes(context: Context, callback: (DataModel) -> Unit) {

        val retrofit: Retrofit = Retrofit.Builder().baseUrl("https://api.chucknorris.io/").addConverterFactory(
            GsonConverterFactory.create()).build()

        val service: ApiService = retrofit.create(ApiService::class.java)

        val call: Call<DataModel> = service.getjokes()

        call.enqueue(object : Callback<DataModel> {
            override fun onResponse(response: Response<DataModel>?, retrofit: Retrofit?) {

                if(response!!.isSuccess){
                    val jokes: DataModel = response.body() as DataModel

                    callback(jokes)
                }
            }

            override fun onFailure(t: Throwable?) {
                Toast.makeText(context, "Request Fail", Toast.LENGTH_SHORT).show()
            }
        })
    }
}