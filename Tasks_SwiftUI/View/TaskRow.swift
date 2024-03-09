import SwiftUI
import CoreData
import Combine

struct TaskRow: View {
    @State var todo: ToDo
    @State var todayDate: Date
    
    var body: some View {
        HStack {
            Text(todo.title ?? "Empty")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 22))
                .clipped()
                .minimumScaleFactor(0.8)
                .lineLimit(nil)
           
            Spacer() // Spacer added here

            Image(systemName: todo.isNotify ? "bell.fill" : "bell.slash.fill")
                .padding()
                .imageScale(.large)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.black)
        }
        .padding()
        .background(Color.blue) // Change the background color as needed

        Text(todo.due.isEqual(currentDate: todayDate) ? "Today" : todo.due.string(format: "dd-MM-yyyy"))
            .bold()
            .foregroundColor(todo.due.isEqual(currentDate: todayDate) ? Color.red : Color.black) // Change the color for the due date
            .font(.system(size: 19))
            .frame(height: 20, alignment: .trailing)

        Text("Due Date:")
            .bold()
            .foregroundColor(Color.black) // Set color for the "Due Date:" text
            .font(.system(size: 16))
            .padding(.trailing) // Add padding to the trailing side
    }
}
