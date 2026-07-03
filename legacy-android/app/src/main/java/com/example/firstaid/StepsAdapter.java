package com.example.firstaid;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;
import com.example.firstaid.models.Step;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class StepsAdapter extends RecyclerView.Adapter<StepsAdapter.ViewHolder> {

    private Context context;
    private List<Step> stepList;

    public StepsAdapter(Context context, List<Step> stepList) {
        this.context = context;
        this.stepList = stepList;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.item_step, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Step step = stepList.get(position);
        holder.txtStepOrder.setText(String.valueOf(step.getStepOrder()));
        holder.txtInstruction.setText(step.getInstruction());

        // Load image if available (from assets or drawable)
        // Here we try to find it in drawables first
        String imgName = step.getImageResource();
        if (imgName != null && !imgName.isEmpty()) {
            int resId = context.getResources().getIdentifier(imgName, "drawable", context.getPackageName());
            if (resId != 0) {
                holder.imgStep.setVisibility(View.VISIBLE);
                holder.imgStep.setImageResource(resId);
            } else {
                // If not found in drawable, hide it or show placeholder
                // For this MVP, we hide it if missing to avoid ugliness
                holder.imgStep.setVisibility(View.GONE);
            }
        } else {
            holder.imgStep.setVisibility(View.GONE);
        }
    }

    @Override
    public int getItemCount() {
        return stepList.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView txtStepOrder;
        TextView txtInstruction;
        ImageView imgStep;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            txtStepOrder = itemView.findViewById(R.id.txtStepOrder);
            txtInstruction = itemView.findViewById(R.id.txtInstruction);
            imgStep = itemView.findViewById(R.id.imgStep);
        }
    }
}
