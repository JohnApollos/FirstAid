package com.example.firstaid;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.example.firstaid.models.Procedure;
import java.util.List;

public class ProceduresAdapter extends RecyclerView.Adapter<ProceduresAdapter.ViewHolder> {

    private Context context;
    private List<Procedure> procedureList;

    public ProceduresAdapter(Context context, List<Procedure> procedureList) {
        this.context = context;
        this.procedureList = procedureList;
    }

    public void updateList(List<Procedure> newList) {
        procedureList = newList;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.item_category, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Procedure procedure = procedureList.get(position);
        holder.txtTitle.setText(procedure.getTitle());

        // Dynamically load icon resource
        int resId = context.getResources().getIdentifier(procedure.getIconName(), "drawable", context.getPackageName());
        if (resId != 0) {
            holder.imgIcon.setImageResource(resId);
        } else {
            holder.imgIcon.setImageResource(R.drawable.app_logo); // Fallback
        }

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, DetailActivity.class);
                intent.putExtra("PROCEDURE_ID", procedure.getId());
                intent.putExtra("PROCEDURE_TITLE", procedure.getTitle());
                intent.putExtra("PROCEDURE_ICON", procedure.getIconName());
                context.startActivity(intent);
            }
        });
    }

    @Override
    public int getItemCount() {
        return procedureList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imgIcon;
        TextView txtTitle;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            imgIcon = itemView.findViewById(R.id.imgIcon);
            txtTitle = itemView.findViewById(R.id.txtTitle);
        }
    }
}
